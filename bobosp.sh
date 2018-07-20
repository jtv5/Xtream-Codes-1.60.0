RTMP="rtmp://104.196.20.47:1935/live"
SOURCE="http://89.163.251.186:8081/loadbalance/sptv/chunks.m3u8"
KEY="bob"

ffmpeg \
    -i "$SOURCE" -deinterlace \
ffmpeg -re -f lavfi -i testsrc -c:v libx264 -b:v 200k -preset ultrafast -b 900k -c:a libfdk_aac -b:a 96k -s 320x240 -x264opts keyint=50 -g 15 -pix_fmt yuv420p \
    -f flv "$RTMP/$KEY"
