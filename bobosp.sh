VBR="300k"
 FPS="15"
 QUAL="medium"
 YOUTUBE_URL="rtmp://104.196.20.47/live"
 SOURCE="http://89.163.251.186:8081/loadbalance/sptv/chunks.m3u8"
 KEY="sptv"

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv240p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
