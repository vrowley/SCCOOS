# Sample Dockerfile to extend standard rstudio image to include extra stuff
# First start with the base & latest rstudio image
FROM rocker/rstudio:latest

# Add any environmental variables
ENV PATH=$PATH

# Run any required commands needed, make directories, etc
RUN useradd jfumo \
  && echo "jfumo:jfumo" | chpasswd \
  && mkdir /home/jfumo \
  && chown jfumo:jfumo /home/jfumo \
  && usermod -G staff jfumo \
  && mkdir /home/jfumo/AutoShoreStation \
  && echo "Doing stuff"

# install library that provides nc-config file that is needed for compiling ncdf4
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install apt-transport-https
RUN apt-get -y install apt-utils
RUN echo "deb https://deb.debian.org/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN apt-get -y install libnetcdf-dev

RUN apt-get -y install default-jre
RUN apt-get -y install default-jdk
RUN apt-get -y install r-cran-rjava
#RUN apt-get -y install libpcre3-dev
#RUN apt-get -y install liblzma-dev
#RUN apt-get -y install libbz2-dev
#RUN wget https://cran.rstudio.com/src/contrib/rJava_0.9-9.tar.gz
#RUN wget https://cran.rstudio.com/src/contrib/xlsxjars_0.6.1.tar.gz
#RUN wget https://cran.rstudio.com/src/contrib/xlsx_0.5.7.tar.gz
#RUN R CMD INSTALL rJava_0.9-9.tar.gz
#RUN R CMD INSTALL xlsxjars_0.6.1.tar.gz
#RUN R CMD INSTALL xlsx_0.5.7.tar.gz

RUN Rscript -e 'install.packages("chron")'
RUN Rscript -e 'install.packages("RColorBrewer")'
RUN Rscript -e 'install.packages("lattice")'
RUN Rscript -e 'install.packages("ncdf4")'
RUN Rscript -e 'install.packages("googledrive")'
RUN Rscript -e 'install.packages("xlsx")'

# Copy any files into the image
# COPY foo.txt /home/jfumo

# Create a mountpoint in the image for linking to a host folder at runtime
VOLUME /home/jfumo/AutoShoreStation

# Specify the container entrypoint at runtime
# In this case, copied from rstudio dockerfile
CMD ["/init"]

# Start using this command
#
# docker build -t sass-oxygen-image:v04
# docker run -i -t --rm -v /Users/vrowley/GIT/AutoShoreStation:/home/jfumo/AutoShoreStation --name sass-oxygen-container04 -d -p 8787:8787 sass-oxygen-image:v04
# docker exec --privileged -i -t sass-oxygen-containerv03 bash

