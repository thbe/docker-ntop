FROM alpine
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/docker-ntop/master/Dockerfile
#   docker build --rm --no-cache -t thbe/ntop .
#
# USAGE:
#   docker run --detach --restart always --cap-add=SYS_ADMIN -e "container=docker" \
#     --name ntop --hostname ntop.$(hostname -d) -p 3000:3000/tcp thbe/ntop
#   docker logs ntop
#   docker exec -ti ntop /bin/sh
#

# Set metadata
LABEL maintainer="Thomas Bendler <code@thbe.org>"
LABEL version="1.0"
LABEL description="Creates an Alpine container serving an NTOP instance"

# Set environment
ENV LANG en_US.UTF-8
ENV TERM xterm

# Set workdir (fix missing pid directory)
WORKDIR /var/lib/ntop

# Install NTOP
RUN apk add --no-cache curl ntop rrdtool perl

# Copy configuration files
COPY root /

# Prepare NTOPNG start
RUN chmod 755 /srv/run.sh

# Expose NTOPNG standard http port
EXPOSE 3000/tcp

# Start NTOPNG
CMD ["/srv/run.sh"]
