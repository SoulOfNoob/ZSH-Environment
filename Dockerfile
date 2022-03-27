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

RUN mkdir /testing
COPY ./ /root/
WORKDIR /root/
CMD ["init.zsh"]
ENTRYPOINT ["/bin/sh"]

# sudo docker build -t testing/alpine:latest . && sudo docker run -it --entrypoint sh testing/alpine:latest