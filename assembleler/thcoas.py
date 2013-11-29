#############################################################################79
"""Enhanced assembler for 16-bit THCO MIPS.

usage: thcoas [-h] [--stdio] [inFile [outFile]]

-h --help       display help and exit
   --stdio      input from stdin and output to stdout, can be used for piping,
                omits inFile and outFile (won't cause an error)
inFile          filename of asm source, default stdin
outFile         filename of binary output, default inFile.bin (when inFile is
                presented) or a.bin (when inFile is omitted)

"""
############################################
# Copyright(c) 2013 Wu xiangjin(2011011278)
# modify by Tuke(2011011273) 2013-11-29
###########################################
import sys
import os.path
from getopt import gnu_getopt, GetoptError
import re
BASIC_SET = set([
    'BTEQZ', 'BNEZ', 'MTSP', 'JR', 'SUBU',
    'SRA', 'BEQZ', 'MFPC', 'CMP', 'LI',
    'LW', 'MFIH', 'MTIH', 'ADDIU', 'B',
    'ADDIU3', 'SLL', 'SW_SP', 'LW_SP', 'AND',
    'ADDU', 'SW', 'ADDSP', 'NOP', 'OR',
    ])
EXTEND_SET = {'JRRA', 'SLTI', 'ADDSP3', 'SLLV', 'SLT'}
PAT_HEX = re.compile(r'^-?(0x)?([0-9a-f]+)h?$')
PAT_REG = re.compile(r'^r[0-7]$')
PAT_BINSTR = re.compile(r'[01]{16}')
ferr = sys.stderr
# options
debug = False
# global state
lineNum = 0
codeAddr = 0
# global info
labelAddr = {}
labelLine = {}


def usage(msg=''):
    ferr.write('%s\n' % msg)
    ferr.write(__doc__)
    sys.exit(2)


def main():
    try:
        opts, args = gnu_getopt(sys.argv[1:], 'qvh', ['stdio', 'help'])
    except GetoptError as err:
        usage(err)
    fin = None
    fout = None
    for o, a in opts:
        if o == '-h' or o == '--help':
            usage()
        elif o == '--stdio':
            fin = sys.stdin
            fout = sys.stdout
        else:
            usage('Unknown option "%s".' % o)
    if fin is None:
        if len(args) > 0:
            fin = open(args[0], 'rU')
            if len(args) > 1:
                outFilename = args[1]
                if len(args) > 2:
                    usage('Too many arguments.')
            else:
                outFilename = os.path.basename(args[0]) + '.bin'
        else:
            usage()

    global lineNum, codeAddr, labelAddr, labelLine
    codeBuf = []
    while 1:
        line = fin.readline()
        if line == '':
            break
        lineNum += 1

        commentPos = line.find(';')
        if commentPos != -1:
            line = line[:commentPos]
        tokenList = line.split()
        if len(tokenList) == 0:
            continue

        if debug:
            ferr.write('%s %s\n' % (lineNum, tokenList))

        if tokenList[0][-1] == ':':
            label = tokenList[0][:-1]
            assert label not in labelAddr,\
                'Line %d: Label already found at Line %d, Addr 0x%04x.' %\
                (lineNum, labelLine[label], labelAddr[label])
            labelAddr[label] = codeAddr
            labelLine[label] = lineNum
            assert len(tokenList) == 1,\
                'Line %d: No token allowed after label.' % lineNum
        else:
            inst = tokenList[0]
            codeBuf.append((lineNum, tokenList))
            codeAddr += 1
    if fin != sys.stdin:
        fin.close()

    if debug:
        ferr.write('%s\n' % labelAddr)

    if fout is None:
        fout = open(outFilename, 'wb')
    codeAddr = 0
    for curLineNum, tokenList in codeBuf:
        lineNum = curLineNum
        inst = tokenList[0]
        if inst not in (BASIC_SET | EXTEND_SET):
            ferr.write(
                'Warning Line %d: Non-basic instruction "%s" used.\n' %
                (lineNum, inst)
                )
        try:
            # Parsers other than parseWithPrototype can be invoke here
            # to provide smarter parse.  Keep parseWithPrototype pure and
            # clean.
            fout.write(genFromBinStr(parseWithPrototype(tokenList)))
        except Exception as err:
            raise Exception('Line %d: %s' % (lineNum, err.message))
        codeAddr += 1
    ferr.write('END.\n')
    if fout != sys.stdout:
        fout.close()


def hex2int(h):
    if h.isdigit():
        return ord(h) - ord('0')
    else:
        assert h in set('abcdef')
        return ord(h) - ord('a') + 10


def parseImm(token, bitN=8, relative=None):
    if token in labelAddr:
        value = labelAddr[token]
        if relative is not None:
            value -= (codeAddr + 1)
    else:
        token = token.lower()
        mat = PAT_HEX.match(token)
        if mat is not None:
            hexStr = mat.group(2)
            value = reduce(lambda s, i: (s << 4) + hex2int(i), hexStr, 0)
            if token[0] == '-':
                value = - value
        else:
            raise Exception('Unknown base for Immediate "%s".' % token)
        if value >= (1 << 15):
            oldV = value
            value -= (1 << 16)
            ferr.write(
                'Warning Line %d: Fixed Immediate "%s" to "%s".\n' %
                (lineNum, hex(oldV), hex(value))
                )
    if value >= (1 << bitN) or value < - (1 << (bitN - 1)):
        raise Exception(
            'Immediate too large, "%s"(%s) exceeds %d bits.' %
            (token, hex(value), bitN)
            )
    if value < 0:
        value += (1 << bitN)

    ans = bin(value)[2:]
    ans = '0' * (bitN - len(ans)) + ans
    return ans


def parseReg(token):
    token = token.lower()
    mat = PAT_REG.match(token)
    if mat is None:
        raise Exception('Unable to parse register from "%s".' % token)
    ans = bin(ord(token[1]) - ord('0'))[2:]
    ans = '0' * (3 - len(ans)) + ans
    return ans


def genFromBinStr(binStr):
    assert PAT_BINSTR.match(binStr) is not None
    word = reduce(lambda s, i: (s << 1) + (i == '1'), binStr, 0)
    return chr(word & 255) + chr(word >> 8)  # Endian!!!


PROTOTYPE = {
    'ADDIU': ['01001', parseReg, parseImm, ],
    'ADDIU3': ['01000', parseReg, parseReg, '0', lambda t: parseImm(t, 4), ],
    'ADDSP3': ['00000', parseReg, parseImm, ],
    'ADDSP': ['01100011', parseImm, ],
    'ADDU': ['11100', parseReg, parseReg, parseReg, '01', ],
    'AND': ['11101', parseReg, parseReg, '01100', ],
    'B': ['00010', lambda t: parseImm(t, 11, relative='rel'), ],
    'BEQZ': ['00100', parseReg, lambda t: parseImm(t, relative='rel'), ],
    'BNEZ': ['00101', parseReg, lambda t: parseImm(t, relative='rel'), ],
    'BTEQZ': ['01100000', lambda t: parseImm(t, relative='rel'), ],
    'BTNEZ': ['01100001', lambda t: parseImm(t, relative='rel'), ],
    'CMP': ['11101', parseReg, parseReg, '01010', ],
    'CMPI': ['01110', parseReg, parseImm, ],
    'INT': ['111110000000', lambda t: parseImm(t, 4), ],
    'JALR': ['11101', parseReg, '11000000', ],
    'JR': ['11101', parseReg, '00000000', ],
    'JRRA': ['1110100000100000', ],
    'LI': ['01101', parseReg, parseImm, ],
    'LW': ['10011', parseReg, parseReg, lambda t: parseImm(t, 5), ],
    'LW_SP': ['10010', parseReg, parseImm, ],
    'MFIH': ['11110', parseReg, '00000000', ],
    'MFPC': ['11101', parseReg, '01000000', ],
    'MOVE': ['01111', parseReg, parseReg, '00000', ],
    'MTIH': ['11110', parseReg, '00000001', ],
    'MTSP': ['01100100', parseReg, '00000', ],
    'NEG': ['11101', parseReg, parseReg, '01011', ],
    'NOT': ['11101', parseReg, parseReg, '01111', ],
    'NOP': ['0000100000000000', ],
    'OR': ['11101', parseReg, parseReg, '01101', ],
    'SLL': ['00110', parseReg, parseReg, lambda t: parseImm(t, 3), '00', ],
    'SLLV': ['11101', parseReg, parseReg, '00100', ],
    'SLT': ['11101', parseReg, parseReg, '00010', ],
    'SLTI': ['01010', parseReg, parseImm, ],
    'SLTU': ['11101', parseReg, parseReg, '00011', ],
    'SLTUI': ['01011', parseReg, parseImm, ],
    'SRA': ['00110', parseReg, parseReg, lambda t: parseImm(t, 3), '11', ],
    'SRAV': ['11101', parseReg, parseReg, '00111', ],
    'SRL': ['00110', parseReg, parseReg, lambda t: parseImm(t, 3), '10', ],
    'SRLV': ['11101', parseReg, parseReg, '00110', ],
    'SUBU': ['11100', parseReg, parseReg, parseReg, '11', ],
    'SW': ['11011', parseReg, parseReg, lambda t: parseImm(t, 5), ],
    'SW_RS': ['01100010', parseImm, ],
    'SW_SP': ['11010', parseReg, parseImm, ],
    'XOR': ['11101', parseReg, parseReg, '01110', ],
    'RET': ['1111111111111111', ],
    'LIT': [lambda t: parseImm(t, 16), ],
    }


def parseWithPrototype(tokenList):
    inst = tokenList[0]
    if inst in PROTOTYPE:
        ans = ''
        idx = 1
        for part in PROTOTYPE[inst]:
            if isinstance(part, str):
                ans += part
            else:
                if len(tokenList) <= idx:
                    raise Exception(
                        'Argument %d of instruction "%s" not found.' %
                        (idx, inst)
                        )
                ans += part(tokenList[idx])
                idx += 1
        if len(tokenList) > idx:
            raise Exception('Too many arguments for instruction "%s".' % inst)
        return ans
    else:
        raise Exception('Unknown instruction "%s".' % inst)


if __name__ == '__main__':
    main()
