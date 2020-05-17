#!/bin/bash

INPViedoFile1=$1
INPVideoFile2=$2
OPVideoFile=
ext1=`ls -ltr $INPViedoFile1 | awk '{prin $9}' | cut -d"." -f2`
ext2=`ls -ltr $INPViedoFile1 | awk '{prin $9}' | cut -d"." -f2`

if ! [ "$ext1" = "$ext2" ]; then
 echo Both the video file has different extention and cannot be merge. Please make sure both the video file has the same type"
 exit 1
fi

if ! [ -e $INPViedoFile1 ]; then
  echo "Video File1 is missing"
  exit 1
fi

if ! [ -e $INPVideoFile2 ]; then
  echo "Video File1 is missing"
 exit 1
fi

OPvideoDir=`dirname $INPViedoFile1`

#Merge the video file 

ffmpeg -i concat:"$INPViedoFile1|$INPVideoFile2" $OPvideoDir/$OPVideoFile.$ext1

echo "Output Video File is : $OPvideoDir/$OPVideoFile.$ext1"
