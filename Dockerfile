FROM ipython/notebook
MAINTAINER Andrew Odewahn "odewahn@oreilly.com" 

#
# Install system dependencies
#
RUN sudo apt-get install -y python-pip python-dev build-essential libatlas-base-dev 
RUN sudo apt-get install -y gfortran gcc-multilib lynx emacs23-nox 
#RUN sudo apt-get install -y glpk python-glpk

#
# Install pip dependencies
#
RUN pip install numpy==1.6.2
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
          
