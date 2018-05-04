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
  && usermod -G staff jfumo
  && mkdir /home/jfumo/AutoShoreStation \
  && echo "Doing stuff"

# install library that provides nc-config file that is needed for compiling ncdf4
RUN echo "deb https://deb.debian.org/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get -y install libnetcdf-dev

RUN R CMD INSTALL 
# Copy any files into the image
# COPY foo.txt /home/jfumo

# Create a mountpoint in the image for linking to a host folder at runtime
VOLUME /home/jfumo/AutoShoreStation

# Specify the container entrypoint at runtime
# In this case, copied from rstudio dockerfile
CMD ["/init"]

# Start using this command
#
# docker build -t sass-oxygen-image:v01
# docker run -i -t --rm -v /Users/vrowley/GIT/AutoShoreStation:/home/jfumo/AutoShoreStation --name sass-oxygen-container -d -p 8787:8787 sass-oxygen-image:v01


