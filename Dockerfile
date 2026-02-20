FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt-get update -y && apt-get install -y
RUN apt-get install -y wget p7zip-full xz-utils unzip

# Install mkvtoolnix
RUN wget -O /etc/apt/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/debian/ bookworm main" > /etc/apt/sources.list.d/mkvtoolnix.list
RUN apt-get update -y && apt-get install -y mkvtoolnix

# Install ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz -O /tmp/ffmpeg-release-amd64-static.tar.xz && \
    tar -xvf /tmp/ffmpeg-release-amd64-static.tar.xz -C /tmp && \
    mv /tmp/ffmpeg-*-amd64-static/ffmpeg /usr/local/bin/ffmpeg && \
    mv /tmp/ffmpeg-*-amd64-static/ffprobe /usr/local/bin/ffprobe && \
    rm -rf /tmp/ffmpeg-release-amd64-static.tar.xz /tmp/ffmpeg-*-amd64-static

# Install mp4decrypt
RUN wget https://www.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip -O /tmp/Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip && \
    unzip /tmp/Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip -d /tmp && \
    mv /tmp/Bento4-SDK-1-6-0-641.x86_64-unknown-linux/bin/mp4decrypt /usr/local/bin/mp4decrypt && \
    rm -rf /tmp/Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip /tmp/Bento4-SDK-1-6-0-641.x86_64-unknown-linux

# # Install shaka-packager
# RUN wget https://github.com/shaka-project/shaka-packager/releases/download/v3.4.2/packager-linux-x64 -O /usr/local/bin/shaka-packager && \
#     chmod +x /usr/local/bin/shaka-packager

# Install anidl
RUN wget https://github.com/anidl/multi-downloader-nx/releases/download/v5.7.0/multi-downloader-nx-linux-x64-cli.7z -O /tmp/multi-downloader-nx-linux-cli.7z && \
    7z x /tmp/multi-downloader-nx-linux-cli.7z -o/usr/local/bin && \
    chmod +x /usr/local/bin/multi-downloader-nx-linux-x64-cli/aniDL && \
    rm /tmp/multi-downloader-nx-linux-cli.7z

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/multi-downloader-nx-linux-x64-cli/aniDL"]
