FROM ubuntu:latest
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 

#
# Install general environment dependencies
#
RUN apt-get update
RUN apt-get install -y python-software-properties python-dev python-pip
RUN apt-get install -y libfreetype6-dev libpng-dev libncurses5-dev vim git-core build-essential curl unzip wget

#
# Install ipython notebook requirements
#
RUN pip install --upgrade pip
RUN pip install numpy==1.7.1
RUN pip install Jinja2==2.6
RUN pip install httplib2==0.8
RUN pip install python-dateutil==2.1
RUN pip install python-gflags==2.0
RUN pip install pyzmq==13.0.0
RUN pip install tornado==2.4.1
RUN pip install wsgiref==0.1.2
RUN pip install ipython==1.1.0
RUN pip install --allow-all-external --allow-unverified  matplotlib 

#
# Install JEM-specific system dependencies
#
RUN sudo apt-get install -y  libatlas-base-dev 
RUN sudo apt-get install -y gfortran gcc-multilib lynx emacs23-nox 
#RUN sudo apt-get install -y glpk python-glpk

#
# Install JEM-specific python packages
#
RUN pip install scipy
RUN pip install neurolab
#RUN pip install hyperloglog                                      
#RUN pip install countminsketch # or build from GitHub repo
RUN pip install pybloom               
#RUN pip install lshash # or build from PyPi tarball

# Configure Nitrious / tug

RUN mkdir -p /usr/local/app/atlas

ADD . /usr/local/app/atlas   
WORKDIR /usr/local/app/atlas  
EXPOSE 8888:8888
CMD ["ipython", "notebook",  "--ip=0.0.0.0",  "--port=8888",  "--pylab=inline", "--no-browser"]
          
