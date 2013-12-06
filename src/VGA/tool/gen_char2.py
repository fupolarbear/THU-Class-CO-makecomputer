fr = open("test.vhd", 'r')
f = open("genvhd.coe", 'w')
# for i in range(2048):
	# f.write('{0:08b},\n'.format(i % 95));

lines = fr.readlines()
for i in xrange(6):
	for j in xrange(64):
		f.write('{0:08b},\n'.format(0));
for i in xrange(len(lines)):
	for j in xrange(6):
		f.write('{0:08b},\n'.format(0));
	l = lines[i];
	for j in l[:-1]:
		f.write('{0:08b},\n'.format(ord(j)-32));
	for j in xrange(64-6-len(l)+1):
		f.write('{0:08b},\n'.format(0));

for i in range(32-6-len(lines)):
	for j in range(64):
		f.write('{0:08b},\n'.format(0));

f.close()