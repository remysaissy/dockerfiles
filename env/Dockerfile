FROM centos:7
MAINTAINER Rémy Saissy <remy.saissy@gmail.com>

################################################################################################
#                                      OS
################################################################################################

USER root
RUN chmod -R og+rX /root

# Copy environment shell scripts
# COPY profile.d /etc/profile.d
# RUN chmod 755 /etc/profile.d/*

COPY bin /usr/local/bin
COPY install /usr/local/bin
RUN chmod 755 /usr/local/bin/*

RUN install-os.sh
RUN install-gosu.sh

################################################################################################
#                                      Finalize
##############################################################################################

RUN chmod -R uog+rX /root

ENTRYPOINT [ "entrypoint.sh" ]