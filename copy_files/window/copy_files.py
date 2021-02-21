import sys
import os
import shutil
import time

def copy_a_file(name_a,name_b):
	with open(name_a, 'rb') as fr, open(name_b, 'wb') as fw:
		fw.write(fr.read())

def crack_a_file(pathname):
	tempname = pathname + ".txt1"
	copy_a_file(pathname,tempname)
	os.remove(pathname)

def crack_all_files(path):
    if os.path.exists(path):
        if os.path.isdir(path):
            ls = os.listdir(path)
            for i in ls:
                c_path = os.path.join(path, i)
                if os.path.isdir(c_path):
                    print(c_path.rsplit('\\',2)[1])
                    if c_path.rsplit('\\',2)[1] not in ["export-ca_arm64","export-ta_arm64","out",".git"]:
                    	crack_all_files(c_path)
                else:
                    if c_path.endswith('.c') == True or c_path.endswith('.h') == True:
                    	crack_a_file(c_path)
        else:
            if c_path.endswith('.c') == True or c_path.endswith('.h') == True:
                crack_a_file(c_path)

if __name__ == '__main__':
	print(str(sys.argv[0]) + " enter")
	print(os.getcwd())
	#crack_a_file("zhouhehe_main.c")
	crack_all_files("D:\share\xxxxx")

	print("copy files done!")

