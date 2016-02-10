# FROM opensuse:latest
ROM opensuse:42.1
RUN zypper ref && zypper -n up
RUN zypper -n in ca-certificates-cacert
RUN zypper -n in vim gcc python-devel git osc  \
wget yum-utils libxml2-devel libxslt-devel libopenssl-devel \
libcurl-devel quilt rpm-build autoconf automake build \
obs-service-tar_scm ca-certificates-mozilla obs-service-recompress \
obs-service-set_version obs-service-download_url obs-service-extract_file

RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev

RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:users /var/shared
VOLUME /var/shared

WORKDIR /home/dev
ENV HOME /home/dev

ADD oscrc /home/dev/.oscrc


RUN chown -R dev:users /home/dev
USER dev
