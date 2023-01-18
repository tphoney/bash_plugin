#syntax=docker/dockerfile-upstream:master-experimental

FROM alpine
RUN apk add --no-cache openssh-client \
   && adduser -u 100 -h /example -S example example

USER example
RUN --mount=type=ssh,uid=100 ssh-add -L
