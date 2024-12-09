FROM ubuntu:22.04
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update \
 && apt install -y tini subversion=1.14.1-3ubuntu0.22.04.1 \
 && apt clean
COPY entrypoint /entrypoint
VOLUME ["/svn"]
EXPOSE 3690
ENTRYPOINT ["tini", "--", "/entrypoint"]
CMD ["svnserve"]
