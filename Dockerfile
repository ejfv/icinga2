FROM icinga/icinga2

USER root
RUN apt-get update 
RUN apt-get install -y \
		python3.7 python3-pip openssh-client ldap-utils  &&\
	apt-get clean && \
	rm -vrf /var/lib/apt/lists/*
RUN pip3 install pywinrm

USER icinga

