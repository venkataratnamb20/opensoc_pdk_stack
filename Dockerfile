FROM ubuntu:latest AS eda

WORKDIR /tmp

 RUN apt-get update && apt-get upgrade -y &&\
    apt-get install  -y sudo 
#    apt-get install  -y sudo vim curl wget git \
#    build-essential tcsh csh tcl-dev tk-dev 

# COPY ./install_tools.sh /tmp/install_tools.sh
COPY ./.bash_aliases /tmp/.bash_aliases
COPY *.sh /tmp
# RUN ./install_xschem.sh

RUN chmod +x /tmp/*.sh && \
#    mkdir -p ./edadir && \
    ./install_dependencies.sh -y &&\
    ./install_tools.sh "edauser" -y

CMD ["ngspice", "-v"]

