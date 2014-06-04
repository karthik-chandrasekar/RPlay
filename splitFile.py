count = 1
for line in open('book1','r').readlines():
    if line and line.strip():
        filename = "%s%s" % (count,".txt")
        fd = open(filename, 'w')
        fd.write(line)
        count += 1
