FROM icinga/icinga2

USER root
RUN apt-get update 
RUN apt-get install -y \
		openssh-client &&\
	rm -vrf /var/lib/apt/lists/*
USER icinga

