FROM ubuntu:14.04

# Install Node
RUN  apt-get update
#RUN  apt-get install -y nodejs
RUN  apt-get install -y npm
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy nodejs
RUN npm install -g azure-cli
RUN apt-get install -y nodejs-legacy
RUN export PATH=$PATH:~/.local/bin
RUN apt-get install -y curl
#RUN bash -xc "$(curl -s https://raw.githubusercontent.com/spinnaker/spinnaker/master/InstallSpinnaker.sh)"


# We can only currently support limited releases
# First guess what sort of operating system
ADD installSpinnaker.sh /
ENTRYPOINT ["/bin/bash", "/installSpinnaker.sh"]

