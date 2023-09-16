# Use the official Rocker RStudio image as the base image
FROM rocker/rstudio:latest

# Set the working directory
WORKDIR /workspaces/Docker-for-bioinformatics

# Update system and install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y \
    build-essential \
    libcurl4-gnutls-dev \
    libssl-dev

# Install Sigprofiler R wrapper packages
RUN R -e "install.packages(c('Sigprofiler'), repos='https://cran.rstudio.com/')"

# Set the entrypoint to start RStudio
ENTRYPOINT ["/init"]
