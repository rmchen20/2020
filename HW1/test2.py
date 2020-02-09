with open('/Users/apple/Desktop/stat/2020/HW1/public_MC3.maf') as f:
    lines = [line.rstrip().split('\t')[2] for line in f]

from collections import Counter
cc = Counter(lines)

for gene, count in cc.most_common(5):
    print (gene, ":", count)
