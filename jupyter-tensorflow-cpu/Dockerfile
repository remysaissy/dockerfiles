FROM jupyter/datascience-notebook
MAINTAINER Rémy Saissy <remy.saissy@gmail.com>
LABEL Description="This image starts jupyter with TensorFlow for CPUs and its g3doc tutorials" Version="1.0"

RUN ln -sf /bin/bash /bin/sh

# Install the tensorflow package as instructed on https://github.com/tensorflow/tensorflow
RUN source activate /opt/conda/envs/python2/ \
        && pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

# Download the sources of the installed version in order to add g3doc
RUN mkdir /tmp/tensorflow \
        && wget -O- https://github.com/tensorflow/tensorflow/archive/0.5.0.tar.gz \
        | tar -zxC /tmp/tensorflow \
        && cp -a /tmp/tensorflow/tensorflow-0.5.0/tensorflow/g3doc /opt/conda/envs/python2/lib/python2.7/site-packages/tensorflow/ \
        && chown -R root:root /opt/conda/envs/python2/lib/python2.7/site-packages/tensorflow/g3doc \
        && find /opt/conda/envs/python2/lib/python2.7/site-packages/tensorflow/g3doc -type d -exec chmod 755 {} \; \
        && find /opt/conda/envs/python2/lib/python2.7/site-packages/tensorflow/g3doc -type f -exec chmod 644 {} \; \      
        && rm -rf /tmp/tensorflow

# Libs necessary so that kernels don't die
RUN apt-get install -y libx11-dev
RUN source activate /opt/conda/envs/python2/ \
        && pip install Pillow==2.9.0 matplotlib sklearn

RUN ln -sf /bin/dash /bin/sh

VOLUME /notebook
WORKDIR /notebook

EXPOSE 8888

CMD jupyter notebook --no-browser --ip=0.0.0.0
