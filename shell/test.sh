#!bin/bash
rm -rf newFile
chunk_size=1900000
file_path=jiangshan.jpg #原文件path
out_path=newFile #产出的文件path
file_size=`wc ${file_path} | awk '{print $3}'`
chunk_number=0
echo "file size : ${file_size}"
remainder=`expr ${file_size} % ${chunk_size}`
echo `dd if=$file_path bs=${remainder} skip=${chunk_number}`