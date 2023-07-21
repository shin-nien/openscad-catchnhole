FROM ubuntu:22.04

RUN apt-get update -y \
 && apt-get install --no-install-suggests --no-install-recommends -y \
    wget ca-certificates unzip \
    && rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget -qO- https://files.openscad.org/OBS-Repository-Key.pub | tee /etc/apt/trusted.gpg.d/obs-openscad-nightly.asc
RUN echo "deb https://download.opensuse.org/repositories/home:/t-paul/xUbuntu_22.04/ ./" > /etc/apt/sources.list.d/openscad.list

RUN apt-get update -y \
 && apt-get install -y openscad-nightly \
 && rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget https://github.com/mmalecki/catchnhole/archive/refs/heads/latest.zip \
&& unzip latest \
&& mv catchnhole-latest /catchnhole

ENTRYPOINT ["openscad-nightly", "--enable", "import-function", "--export-format", "stl", "-o", "/workspace/output.stl", "/workspace/main.scad"]