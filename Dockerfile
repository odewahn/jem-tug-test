#
# This is a sample dockerfile for spinning up a content image
# Basically, it starts the base box and then uses the 
# atlas api to load up the content
#

FROM ipython/notebook
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 

#
# Install system dependencies
#
RUN sudo apt-get install -y python-pip python-dev build-essential libatlas-base-dev 
RUN sudo apt-get install -y gfortran gcc-multilib lynx emacs23-nox 
RUN sudo apt-get install -y glpk python-glpk

#
# Install pip dependencies
#
pip install scipy
pip install neurolab
pip install hyperloglog                                      
pip install countminsketch # or build from GitHub repo
pip install pybloom               
pip install lshash # or build from PyPi tarball

# Configure Nitrious / tug

RUN mkdir -p /usr/local/app/atlas

ADD . /usr/local/app/atlas     # NOT SURE WHAT PATH TO USE
WORKDIR /usr/local/app/atlas   # I assume this needs to match
EXPOSE 8888                    # Notebooks server runs on 8888 by default
CMD ["ipython", "notebook",  "--ip=0.0.0.0",  "--port=8888",  "--pylab=inline", "--no-browser"]
          
