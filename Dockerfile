FROM flynn/busybox
MAINTAINER Jonathan Rudenberg <jonathan@titanous.com>

ADD ./build/app /bin/app
ADD ./build/sdutil /bin/sdutil

ENTRYPOINT ["/bin/app"]
