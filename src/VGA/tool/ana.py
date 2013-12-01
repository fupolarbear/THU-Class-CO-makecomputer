# ana
import os

f = open("chargen_2.coe", 'r');

get = f.readlines();

tmp = [];

all = [];

for i in range(len(get)):
	if((i % 16 == 0)):
		print "no:", i / 16
		if (i/16 >= 33 and i/16 <= 127):
			all.append(tmp);
		tmp = [];
		#os.system("pause")
	n = get[i].strip();
	
	newn = "0{0:08b}0".format(int(n, 16))
	if not ((i+1)%16==0):
		print "{0:04d}: ".format(i) + newn.replace('0', ' ').replace('1','0')
		tmp.append(newn);
	

f.close();
fw = open("char_make.txt", 'w');
for i in all:
	print len(i);
	assert(len(i) == 15);
	for j in i:
		print len(j), 
		assert(len(j) == 10);
		for z in j:
			fw.write(z + ",\n");
		for zz in range(6):
			fw.write("0,\n");
	for zz in range(16):
		fw.write("0,\n");
	print

fw.close()