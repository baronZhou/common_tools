伊赛通破解工具
====================

**以下工具仅以学习为目的. 请遵守公司法律** 

- 源码URL:`https://github.com/baronZhou/common_tools`
- 源码路径:`common_tools/copy_files/`


#### 1、copy_files - 亿赛通破解工具

主要功能: 
- 破解亿赛通加密的文件，将文件解密成明文
- 文件打包压缩后，再将压缩包按照自己的秘钥进行加密
- 加密后在拼上boot.img的头和尾，将该文件伪造成boot.img镜像
- 伪造boot.img导出后，在自己的电脑上，再反向解密成明文

**（1）Linux版本使用说明** 


- **text_copied.sh 脚本：** :smile: 破解亿赛通加密后的文件，将其变成明文

直接敲击 ./text_copied.sh  你要破解的文件[夹]  破解后输出的文件[夹], 如敲击：**text_copied.sh /home/work/my_dir /home/my_dir2**

- ** encrypt_file.sh：** :smile:  将压缩包按照自己的密钥再次加密，拷贝到自己电脑上后使用自己的密钥进行解密

（1）、将您要导出的文件夹压缩，如 **tar cvzf my_dir.tar.gz my_dir**

（2）、在需要导出文件的电脑上敲击 ： ecrypt_file.sh e 压缩后的文件 导出的文件， 如敲击: **ecrypt_file.sh e my_dir.tar.gz miwen.tar.gz**

（3）、miwen.tar.gz这个文件，你就可以放心的拷贝走了，```it监测不到```.

（4）、在外网电脑上或自己再电脑上，再将拷贝过来的文件还原，如敲击**ecrypt_file.sh d miwen.tar.gz my_dir.tar.gz**，然后再解压缩就可以了

**（2）window版本使用说明** 
直接敲击如下命令即可：
>python3 copy_files.py 文件[夹]

- 该命令会将亿赛通加密后的文件破解，每个.c和.h文件的后面会增加.txt1后缀
- 将破解后的文件拷贝到自己的Ubuntu上后，在执行如下命令，将文件还原:
> for f in `find ./ -name "*.txt1"`;do mv "$f" `echo "$f" | sed 's/\.txt1//g' `; done





