f = open("genmem.coe", 'w')

# for i in range(2048):
	# f.write('{0:08b},\n'.format(i % 95));

for i in range(30):
	for j in range(40):
		f.write('{0:08b},\n'.format((i*40+j) % 95));
	for j in range(24):
		f.write('{0:08b},\n'.format(0));

for i in range(2):
	for j in range(64):
		f.write('{0:08b},\n'.format(0));

f.close()