print("hello")
f = open("import.txt","r")
i=0
for x in f:
    with open("../urdf"+str(i+1)+".yaml","w") as myfile:
        i=i+1
        char_iter=0
        words=x.split()
   # print(words)
        iterator = 0
        tmp_str = ""
        tmp_rpy = ""
        tmp_xyz = ""
        for z in words:
            #print(words[iterator])

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
                                #print("printy boiii")
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
                    tmp_str += "0 0"
                    tmp_rpy += words[iterator] + " 0 "
                if iterator == 3:   # z axis rot
                    tmp_str += "0"
                    tmp_rpy += words[iterator]

                float(words[iterator])

            iterator=iterator+1
        myfile.write("joint_xyz: "+tmp_xyz+"\n")
        myfile.write("joint_rpy: "+tmp_rpy+"\n")
        myfile.write("axis: "+tmp_str+"\n")
        myfile.write("link_len: {}\n".format(words[0]))
        myfile.write("link_rpy: 0 0 0\n")
        myfile.write("link_xyz: {} 0 0\n".format(float(words[0])/2))
  #  j1.write(tmp_xyz)
  #  j2.write(tmp_rpy)
  #  j3.write(tmp_str)
        char_iter=char_iter+1
