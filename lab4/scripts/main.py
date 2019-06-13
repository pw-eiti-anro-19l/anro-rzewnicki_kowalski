print("hello")
f = open("import.txt","r")
i=0
for x in f:
    j1 = open("xyz"+str(i)+".yaml","w")
    j2 = open("rpy"+str(i)+".yaml","w")
    j3 = open("axis"+str(i)+".yaml","w")
    i=i+1
    char_iter=0
    words=x.split()
   # print(words)
    iterator = 0
    tmp_str = ""
    tmp_rpy = ""
    tmp_xyz = ""
    for z in words:
        print(words[iterator])

        if words[iterator][0]=='f':
            if iterator == 0:   # x axis change
                tmp_str += ""
            if iterator == 1:   # z axis change
                tmp_str += ""
            if iterator == 2:   # x axis rot
                tmp_str += "1 0"
                if 0 == words[iterator].endswith('f'):
                    if words[iterator][1] == '+':
                        for w in words[iterator][2:]:
                            tmp_rpy += w
                        tmp_rpy += " 0 "
                else:
                    tmp_rpy += "0 0 "
            if iterator == 3:   # z axis rot
                tmp_str += " 1"
                if 0 == words[iterator].endswith('f'):
                    if words[iterator][1] == '+':
                        for w in words[iterator][2:]:
                            print("printy boiii")
                            tmp_rpy += w
                else:
                    tmp_rpy += "0"

        else:

            if iterator == 0:   # x axis change
                tmp_str += ""
                tmp_xyz += words[iterator] + " 0 "
            if iterator == 1:   # z axis change
                tmp_xyz += words[iterator]
                tmp_str += ""
            if iterator == 2:   # x axis rot
                tmp_str += "0 0 "
                tmp_rpy += words[iterator] + " 0 "
            if iterator == 3:   # z axis rot
                tmp_str += "0"
                tmp_rpy += words[iterator]

            float(words[iterator])

        iterator=iterator+1
    j1.write(tmp_xyz)
    j2.write(tmp_rpy)
    j3.write(tmp_str)
    char_iter=char_iter+1
