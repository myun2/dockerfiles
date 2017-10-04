FROM alpine
LABEL description="Alpine Linux + Update + gcc,g++,make,wget,ncurses-dev"

RUN apk update
RUN apk add gcc g++ make

# Update Certificates
RUN apk add ca-certificates wget \
  && update-ca-certificates
RUN apk add ncurses-dev
