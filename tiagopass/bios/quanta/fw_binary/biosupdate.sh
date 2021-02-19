#!/bin/sh

./PreUpdate.sh $1
if [ `echo $?` == "1" ];then 
  exit 1
fi

echo "Update BIOS..."
./afulnx_64 $1 /P /B /X /N /K
