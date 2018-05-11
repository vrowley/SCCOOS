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
RUN apt-get -y install cron

#
# Useful commands
#
#  docker build -t sass-nb-ph:01 .
#  docker run -i -t --rm -v /Users/vrowley/GIT/AutoShoreStation:/home/jfumo/AutoShoreStation --cap-add=SYS_ADMIN --name sass-nb-ph rocker/r-base bash
#
# To run the script from the command line:  Rscript <scriptname>
#
#