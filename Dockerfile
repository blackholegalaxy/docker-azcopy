FROM microsoft/dotnet:2.1-runtime

LABEL maintainer="blackholegalaxy"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         rsync \
         libunwind8 \
         zip \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex \
    && curl -L -o azcopy.tar.gz \
    https://aka.ms/downloadazcopylinux64 \
    && tar -xf azcopy.tar.gz && rm -f azcopy.tar.gz \
    && ./install.sh && rm -f install.sh \
    && rm -rf azcopy

CMD ["azcopy", "--version"]
