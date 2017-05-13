
import sys

id_dict = {}

f1 = open(sys.argv[1])
f2 = open(sys.argv[2])

for line in f1: 
    sp = line.strip().split()
    for a in sp: 
        aaa = int(a)
        if aaa not in id_dict:
            id_dict[aaa] = 1
        else:
            id_dict[aaa] +=1

for line in f2: 
    sp = line.strip().split()
    for a in sp: 
        aaa = int(a)
        if aaa not in id_dict:
            id_dict[aaa] = 1
        else:
            id_dict[aaa] += 1
for a,b in sorted(id_dict.items()):
    print b
