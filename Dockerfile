FROM ubuntu:20.04 as ubuntu-up-to-date

RUN apt update && apt upgrade -y && apt clean



FROM ubuntu-up-to-date

RUN apt install -y wget vim-tiny git && apt clean
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends tzdata
RUN apt install -y python3 python3-pip python3-requests python3-numpy python3-pyproj python3-gdal python3-shapely python3-rtree python3-pil python3-pil.imagetk p7zip-full libnvtt-bin freeglut3

RUN useradd -d /ortho -s /bin/bash -m -u 9876 ortho
USER ortho
WORKDIR /ortho

COPY . /ortho/ortho
#RUN wget -O - https://github.com/oscarpilote/Ortho4XP/archive/refs/tags/v1.20b.tar.gz | tar xzf -
#RUN git clone --depth=1 https://github.com/oscarpilote/Ortho4XP.git
#RUN mkdir -p custom_scenery overlays

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

