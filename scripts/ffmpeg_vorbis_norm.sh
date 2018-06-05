#!/bin/zsh
# Create file fast
> /tmp/ffmpeg_convert_toOGG.log

#find . -type f -name '*.mp3' -exec bash -c \
#    'ffmpeg -i "$0" -y \
#    -c:a libopus  \
#    "${0/%mp3/ogg}" && \
#    echo $0 >> /tmp/ffmpeg_converter_toOGG.log'  '{}' \;

while read FILE; do
    #NFILE="${a[@]/%mp3/opus}"
    ffmpeg -i "$FILE" "${FILE/%ogg/opus}"
    echo $FILE >> /tmp/ffmpeg_convert_toOGG.log
    mv $FILE /tmp/$FILE
done < ~/music/playlist/VORBIS\ QUE\ NAO\ FUNCIONAM.m3u
