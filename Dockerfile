FROM ipython/scipystack
MAINTAINER Andrew Odewahn "odewahn@oreilly.com"

RUN mkdir -p /atlas

ADD . /atlas
WORKDIR /atlas
EXPOSE 8888
CMD ["ipython", "notebook",  "--ip=0.0.0.0",  "--port=8888",  "--pylab=inline", "--no-browser"]
