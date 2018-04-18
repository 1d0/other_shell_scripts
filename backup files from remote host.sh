#!/bin/bash
login= #login for ssh remote server
host= #host remote server
r_path=/home/dev/files/ #folder remote server
l_path=/home/dev/from_server #local folder
tar_name=archive.tar #archive name for files

MD5_remote="$(ssh $login@$host "
cd $r_path && tar -cf $tar_name ./* && md5sum $tar_name")
" #variable for connect to remote host, archive files and get md5hash archive
md5_r="$(echo "$MD5_remote" | cut -d ' ' -f 1)" #get only md5 remote archive

scp -r $login@$host:$r_path/$tar_name $l_path/ #arhive copy on local host
md5_l="$(md5sum $l_path/$tar_name | cut -d ' ' -f 1)" #get only md5 local archive

if [[ $md5_r = $md5_l ]] #eq
then
  echo "RAVNO"
else
  echo "NE RAVNO"
fi
