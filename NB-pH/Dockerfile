# Sample Dockerfile to extend rocker/r-base image to include things needed to run 
# NB SASS pH computations hourly

# First start with the latest image
FROM rocker/r-base

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
RUN apt-get -y upgrade
RUN apt-get install apt-transport-https
RUN apt-get -y install apt-utils
RUN echo "deb https://deb.debian.org/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN echo "deb http://http.debian.net/debian sid main" > /etc/apt/sources.list.d/debian-unstable.list
RUN apt-get -y install cron
RUN apt-get -y install libnetcdf-dev
RUN apt-get -y install r-cran-rjava

RUN Rscript -e 'install.packages("lubridate")'
RUN Rscript -e 'install.packages("ncdf4")'
RUN Rscript -e 'install.packages("xlsx")'

#
# Put command to run R script into /etc/cron.daily
# Put command to run R script into /etc/cron.d/Get\ Converted\ pH\ Data.R
#
RUN echo "*/5 * * * * Rscript /home/jfumo/AutoShoreStation/pH/Get\ Converted\ pH\ Data.R" > /etc/cron.daily/NB-pH
RUN /etc/init.d/cron reload

#
# Useful commands
#
#  docker build -t sass-nb-ph:01 .
#  docker run -i -t --rm -v /Users/vrowley/GIT/AutoShoreStation:/home/jfumo/AutoShoreStation --cap-add=SYS_ADMIN --name sass-nb-ph rocker/r-base bash
#  docker run -i -t --rm -v /Users/vrowley/GIT/AutoShoreStation:/home/jfumo/AutoShoreStation --cap-add=SYS_ADMIN --name sass-nb-phv01 sass-nb-ph:01 bash
# 
# To run the script from the command line:  Rscript <scriptname>
#
#