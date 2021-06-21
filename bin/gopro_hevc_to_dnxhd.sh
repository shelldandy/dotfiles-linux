#!/usr/bin/bash
#
# Convert GoPro Hero7/Hero8 videos (mainly HEVC) to DNxHD and AAC to PCM which can be read with DaVinci Resolve 16 in Linux
# Also keeps GoPro's metadata
#
# Required dependency: ffmpeg 4.1
# To do: per-stream error handling, actually use datastream count and more efficient parsing of ffprobe
#
# Free for the taking.
#
# Source: https://askubuntu.com/questions/907398/how-to-convert-a-video-with-ffmpeg-into-the-dnxhd-dnxhr-format
# Source: https://www.reddit.com/r/ffmpeg/comments/8qosoj/merging_raw_gpmd_as_metadata_stream/
# Source: http://coderunner.io/how-to-compress-gopro-movies-and-keep-metadata/
# Source: https://trac.ffmpeg.org/wiki/FFprobeTips
#
# gopro_hevc_to_dnxhd.sh
VERSION=1.0

# Check if input file exists
if [[ ! -f "$1" ]]; then
    echo "Input file not found!"
    exit 1
fi

DEBUG=1
VERBOSE=info
VIDEO_CODEC=dnxhd
CODEC_PROFILE=dnxhr_hq
RESOLUTION=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$1")
FPS=$(ffprobe -v error -select_streams v:0 -show_entries stream=avg_frame_rate -of default=noprint_wrappers=1:nokey=1 "$1")
VIDEO_BITRATE=60M
PIXEL_FORMAT=yuv422p
AUDIO_CODEC=pcm_s16le

# Set to 0 to disable copying of all GoPro datastreams
COPY_GOPROMETADATA=1

# Following handler_names has a tab character at the beginning and 2 spaces at the end
GOPROTCD="GoPro TCD  "
GOPROMET="GoPro MET  "
GOPROSOS="GoPro SOS  "

#####
##### End of user variables
#####

if [[ $DEBUG -ne 0 ]]; then echo "Settings: $VIDEO_CODEC $CODEC_PROFILE $RESOLUTION $FPS $VIDEO_BITRATE $PIXEL_FORMAT $AUDIO_CODEC"; fi

FFMPEG_PARAM=('-i' "$1")
FFMPEG_PARAM+=('-v' "$VERBOSE")
FFMPEG_PARAM+=('-c:v' "$VIDEO_CODEC")
FFMPEG_PARAM+=('-profile:v' "$CODEC_PROFILE")
FFMPEG_PARAM+=('-s' "$RESOLUTION")
FFMPEG_PARAM+=('-r' "$FPS")
FFMPEG_PARAM+=('-b:v' "$VIDEO_BITRATE")
FFMPEG_PARAM+=('-pix_fmt' "$PIXEL_FORMAT")
FFMPEG_PARAM+=('-acodec' "$AUDIO_CODEC")
FFMPEG_PARAM+=('-copy_unknown')
FFMPEG_PARAM+=('-map' "0:v")
FFMPEG_PARAM+=('-map' "0:a")

NUM_STREAMS=$(ffprobe -v error -show_entries format=nb_streams -of default=noprint_wrappers=1:nokey=1 "$1")
if ((NUM_STREAMS < 3)); then
  echo "Something is wrong here...maybe only video/audio streams?"
  exit 1
fi
if [[ $DEBUG -ne 0 ]]; then echo "$NUM_STREAMS" streams found; fi

GOPRO_NAME_DATASTREAM0=$(ffprobe -v error -select_streams d:0 -show_entries stream_tags=handler_name -of default=noprint_wrappers=1:nokey=1 "$1")
GOPRO_NAME_DATASTREAM1=$(ffprobe -v error -select_streams d:1 -show_entries stream_tags=handler_name -of default=noprint_wrappers=1:nokey=1 "$1")
GOPRO_NAME_DATASTREAM2=$(ffprobe -v error -select_streams d:2 -show_entries stream_tags=handler_name -of default=noprint_wrappers=1:nokey=1 "$1")

if [[ $COPY_GOPROMETADATA -ne 0 ]]; then
  # Check if GoPro TCD exists (usually missing in 120fps+ videos)
  if [[ $GOPRO_NAME_DATASTREAM0 == "$GOPROTCD" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROTCD")
    FFMPEG_PARAM+=('-tag:d:0' "tmcd")
    FFMPEG_PARAM+=('-metadata:s:d:0' "handler=$GOPROTCD")
    FFMPEG_PARAM+=('-metadata:s:d:0' "handler_name=$GOPROTCD")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro TCD exists at datastream 0"; fi
  fi

  if [[ $GOPRO_NAME_DATASTREAM1 == "$GOPROTCD" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROTCD")
    FFMPEG_PARAM+=('-tag:d:1' "tmcd")
    FFMPEG_PARAM+=('-metadata:s:d:1' "handler=$GOPROTCD")
    FFMPEG_PARAM+=('-metadata:s:d:1' "handler_name=$GOPROTCD")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro TCD exists at datastream 1"; fi
  fi

  if [[ $GOPRO_NAME_DATASTREAM2 == "$GOPROTCD" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROTCD")
    FFMPEG_PARAM+=('-tag:d:2' "tmcd")
    FFMPEG_PARAM+=('-metadata:s:d:2' "handler=$GOPROTCD")
    FFMPEG_PARAM+=('-metadata:s:d:2' "handler_name=$GOPROTCD")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro TCD exists at datastream 2"; fi
  fi

  # Check if GoPro MET exists
  if [[ $GOPRO_NAME_DATASTREAM0 == "$GOPROMET" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROMET")
    FFMPEG_PARAM+=('-tag:d:0' "gpmd")
    FFMPEG_PARAM+=('-metadata:s:d:0' "handler=$GOPROMET")
    FFMPEG_PARAM+=('-metadata:s:d:0' "handler_name=$GOPROMET")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro MET exists at datastream 0"; fi
  fi

  if [[ $GOPRO_NAME_DATASTREAM1 == "$GOPROMET" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROMET")
    FFMPEG_PARAM+=('-tag:d:1' "gpmd")
    FFMPEG_PARAM+=('-metadata:s:d:1' "handler=$GOPROMET")
    FFMPEG_PARAM+=('-metadata:s:d:1' "handler_name=$GOPROMET")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro MET exists at datastream 1"; fi
  fi

  if [[ $GOPRO_NAME_DATASTREAM2 == "$GOPROMET" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROMET")
    FFMPEG_PARAM+=('-tag:d:2' "gpmd")
    FFMPEG_PARAM+=('-metadata:s:d:2' "handler=$GOPROMET")
    FFMPEG_PARAM+=('-metadata:s:d:2' "handler_name=$GOPROMET")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro MET exists at datastream 2"; fi
  fi

  # Check if GoPro SOS exists
  # Input stream GoPro SOS recovery (fdsc) is currently unsupported by ffmpeg, copied as gpmd for now
  if [[ $GOPRO_NAME_DATASTREAM0 == "$GOPROSOS" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROSOS")
    FFMPEG_PARAM+=('-tag:d:0' "gpmd")
    FFMPEG_PARAM+=('-metadata:s:d:0' "handler=$GOPROSOS (original fdsc)")
    FFMPEG_PARAM+=('-metadata:s:d:0' "handler_name=$GOPROSOS (original fdsc)")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro SOS exists at datastream 0"; fi
  fi

  if [[ $GOPRO_NAME_DATASTREAM1 == "$GOPROSOS" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROSOS")
    FFMPEG_PARAM+=('-tag:d:1' "gpmd")
    FFMPEG_PARAM+=('-metadata:s:d:1' "handler=$GOPROSOS (original fdsc)")
    FFMPEG_PARAM+=('-metadata:s:d:1' "handler_name=$GOPROSOS (original fdsc)")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro SOS exists at datastream 1"; fi
  fi

  if [[ $GOPRO_NAME_DATASTREAM2 == "$GOPROSOS" ]]; then
    FFMPEG_PARAM+=('-map' "0:m:handler_name:$GOPROSOS")
    FFMPEG_PARAM+=('-tag:d:2' "gpmd")
    FFMPEG_PARAM+=('-metadata:s:d:2' "handler=$GOPROSOS (original fdsc)")
    FFMPEG_PARAM+=('-metadata:s:d:2' "handler_name=$GOPROSOS (original fdsc)")
    if [[ $DEBUG -ne 0 ]]; then echo "GoPro SOS exists at datastream 2"; fi
  fi
fi

FFMPEG_PARAM+=('-f' "mov")

#if [[ $DEBUG -ne 0 ]]; then echo "ffmpeg command: ffmpeg ${FFMPEG_PARAM[@]}" "$1-output.mov"; fi
ffmpeg "${FFMPEG_PARAM[@]}" "$1-output.mov"
