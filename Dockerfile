FROM icinga/icinga2

USER root
RUN apt-get update 
RUN apt-get install -y \
		python3.7 openssh-client &&\
	apt-get clean && \
	rm -vrf /var/lib/apt/lists/*
USER icinga

