#! /bin/bash
#
# Diffusion youtube avec ffmpeg

# Configurer youtube avec une résolution 720p. La vidéo n'est pas scalée.

VBR="200k"                                    # Bitrate de la vidéo en sortie
FPS="15"                                       # FPS de la vidéo en sortie
QUAL="low"                                  # Preset de qualité FFMPEG
YOUTUBE_URL="rtmp://104.196.20.47:1935/live"  # URL de base RTMP youtube

SOURCE="http://www.blogger.com/video-play.mp4?contentId=cc692bc9c5f4200d"              # Source UDP (voir les annonces SAP)
KEY="bob"                                     # Clé à récupérer sur l'event youtube

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -r 15 -g 15 -b:v 200k \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"
