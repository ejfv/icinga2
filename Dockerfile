FROM debian

ENV SIPP_VERSION 3.6.1


RUN apt-get update
RUN apt-get install -y build-essential git ncurses-dev curl cmake
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /build  && \
    cd /build && \
    curl -sqLkv https://github.com/SIPp/sipp/releases/download/v${SIPP_VERSION}/sipp-${SIPP_VERSION}.tar.gz | tar xvzf - --strip-components=1 && \
    ./build.sh --none




FROM icinga/icinga2

USER root
RUN apt-get update 
RUN apt-get install -y \
		python3.7 openssh-client &&\
	apt-get clean && \
	rm -vrf /var/lib/apt/lists/*
COPY --from=0 /build/sipp /bin

USER icinga

