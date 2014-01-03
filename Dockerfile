FROM flynn/busybox
MAINTAINER Jeff Lindsay <progrium@gmail.com>

ADD ./build/app /bin/app
ADD ./build/sdutil /bin/sdutil

ENTRYPOINT ["/bin/app"]