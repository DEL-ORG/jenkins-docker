FROM httpd
RUN apt update
RUN apt install vim -y
RUN apt install unzip -y
RUN apt install wget -y
RUN cd /usr/local/apache2/htdocs
RUN rm -rf index.html 
RUN  wget https://warfiles-for-docker.s3.amazonaws.com/app/creative.zip
RUN unzip creative.zip
RUN rm -rf creative.zip