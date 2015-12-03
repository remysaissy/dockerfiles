# jupyter-tensorflow-cpu  #

Dockerized Jupyter with tensorflow in CPU mode and the g3doc tutorials included.
With this container, you can follow the tutorial on Tensorflow's website:
http://www.tensorflow.org/tutorials/mnist/beginners/index.html

## Usage ##

### Pulling the container ###

```
docker pull remysaissy/jupyter-tensorflow-cpu
```

### Starting the container ###

- jupyter is exposed on port 8888
- notebooks are stored in the /notebook directory

```
docker run -d -p 8888:8888 -v /home/me/notebook:/notebook remysaissy/jupyter-tensorflow-cpu
```

### Using the container ###

Browse to http://localhost:8888
