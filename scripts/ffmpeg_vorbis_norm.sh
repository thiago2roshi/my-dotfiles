#!/bin/zsh

touch /tmp/ffmpeg_convert_toMP3.log
touch /tmp/ffmpeg_convert_toOGG.log

find . -type f -name '*.ogg' -exec bash -c 'ffmpeg -i "$0" -acodec libmp3lame -b:a 320k "${0/%ogg/mp3}" && echo $0 >> /tmp/ffmpeg_convert_toMP3.log ' '{}' \;

#for FILE in /home/thiago/Desktop/MUSICAS-tes/**/*.ogg; do
#    NFILE="${a[@]/%ogg/mp3}"
#    ffmpeg -i $FILE -acodec libmp3lame -b:a 320k $NFILE
#    echo $FILE >> /tmp/ffmpeg_convert_toMP3.log
#done

telegram-cli -W -e "msg Thiagoroshi 'ffmpeg to mp3 terminado 1/2'"

find . -type f -name '*.mp3' -exec bash -c 'ffmpeg -i "$0" -y -acodec libvorbis -b:a 320k "${0/%mp3/ogg}" && echo $0 >> /tmp/ffmpeg_converter_toOGG.log && rm -rf "$0"' '{}' \;

#for FILE in /home/thiago/Desktop/MUSICAS-tes/**/*.mp3; do
#    NFILE="${a[@]/%ogg/mp3}"
#    ffmpeg -i $FILE -acodec libvorbis -b:a 320k $NFILE
#    echo $FILE >> /tmp/ffmpeg_convert_toOGG.log
#    rm -rf $FILE 
#done

telegram-cli -W -e "msg Thiagoroshi 'ffmpeg to ogg terminado 2/2'"
