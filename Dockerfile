FROM jenkins/jenkins:latest

#Variables de descripcion (Opcionales)
LABEL AUTOR 'lojasot Solutions' 
LABEL VERSION '1' 

#Definimos usuario default establecido en jenkins
ENV USER 'jenkins'

#Iniciamos con usuario root para tener privilegios de ejecucion
USER root
RUN apt-get update

# Copiar plugins adiconales a instalar
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#Instalar docker Cli para manejo externo de docker HOST
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-get -y --allow-unauthenticated install docker-ce-cli containerd.io
RUN groupadd docker && \ 
    usermod -aG docker ${USER} && \
    newgrp docker

#Instalar docker compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Regresamos de nuevo al usuario por default
USER ${USER}

