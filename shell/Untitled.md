-   shell 分片copy文件

```shell
#!bin/bash
chunk_size=1900000
file_path=jiangshan.jpg #原文件
out_path=newFile #产出的文件
file_size=`wc ${file_path} | awk '{print $3}'`
chunk_number=0
echo "file size : ${file_size}"
remainder=`expr ${file_size} % ${chunk_size}`
if [ ${remainder} -eq 0 ]
then
    chunk_number=`expr ${file_size} / ${chunk_size}`
    echo $chunk_number
    for chunk_index in {0..${chunk_number}}
    do
        dd if=$file_path of=$out_path bs=$chunk_size skip=`expr ${chunk_number}` seek=`expr ${chunk_number}`
    done
else
    chunk_number=`expr ${file_size} / ${chunk_size}`
    echo "chunk number :" $chunk_number
    [ ${chunk_number} > 0 ] && cycle=`expr ${chunk_number} - 1` || cycle=0
    for chunk_index in {0..$cycle}
    do
        dd if=$file_path of=$out_path bs=$chunk_size skip=${chunk_number} seek=${chunk_number}
    done
    dd if=$file_path bs=${remainder} skip=${chunk_number} | >> ${out_path}
fi
echo "out file size : " `wc ${out_path} | awk '{print $3}'`
```

