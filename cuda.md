# Getting Cuda Support on FFMPEG

From: https://developer.nvidia.com/blog/nvidia-ffmpeg-transcoding-guide/

```sh
sudo apt install --reinstall libavcodec58 libavdevice58 libavfilter7 libavformat58 libavresample4 libavutil56 libpostproc55 libswresample3 libswscale5
```

Nice conversion with CPU Only on normal apt ffmpeg

```sh
ffmpeg -i input.MP4 -vcodec h264 -q:v 2 -b:v 60M -x264-params opencl=true -acodec aac -q:a 0 -f mov output.mov
```

Optimal settings with Cuda power

```sh
ffmpeg -hwaccel cuda -hwaccel_output_format cuda -y -i INPUT -c:v hevc_nvenc -b:v 60M -movflags +faststart -pass 1 -an -f null /dev/null && \
ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i INPUT -c:v hevc_nvenc -b:v 60M -movflags +faststart -pass 2 -c:a aac -b:a 128k OUTPUT.mp4
```
