FROM alpine:latest
RUN apk update && \
      apk add --no-cache \
      openssh-keygen \
      wget \
      git \
      zsh \
      curl \
      openssh-client \
      shadow

COPY ./ /root/
WORKDIR /root/
CMD ["init.sh"]
ENTRYPOINT ["/bin/sh"]

# sudo docker build -t testing/alpine:latest . && sudo docker run -it --entrypoint sh testing/alpine:latest
# docker build -t testing/alpine:latest . && docker run -it  testing/alpine:latest