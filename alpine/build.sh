docker build . -t alpine-base -f Dockerfile
docker tag alpine-base myun2/alpine-base
docker tag alpine-base myun2/alpine-base:3.6
