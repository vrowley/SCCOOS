# Sample Dockerfile to extend standard rstudio image to include extra stuff
# First start with the base & latest rstudio image
FROM rocker/rstudio:latest

# Add any environmental variables
ENV PATH=$PATH

# Run any required commands needed, make directories, etc
RUN useradd simon \
  && echo "simon:simon" | chpasswd \
  && mkdir /home/simon \
  && chown simon:simon /home/simon \
  && mkdir /home/simon/hostfolder \
  && echo "Doing stuff"

# Copy any files into the image
# COPY foo.txt /home/simon

# Create a mountpoint in the image for linking to a host folder at runtime
VOLUME /home/simon/hostfolder

# Specify the container entrypoint at runtime
# In this case, copied from rstudio dockerfile
CMD ["/init"]




