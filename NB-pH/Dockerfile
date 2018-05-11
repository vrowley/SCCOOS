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

# Setup things for cron
# /etc/cron.{hourly|daily|weekly|monthly}
RUN mkdir /etc/cron.d  \
  && mkdir /etc/cron.hourly \
  && mkdir /etc/cron.monthly


#
# Useful commands
#
#  docker build -t sass-nb-ph:01 .
#  docker run -i -t --rm -v /Users/vrowley/GIT/AutoShoreStation:/home/jfumo/AutoShoreStation --cap-add=SYS_ADMIN --name sass-nb-ph rocker/r-base bash
#