# docker-sage

Docker container for Sage (http://sagemath.org).


The `Dockerfile` builds Sage 6.3 from source.

**project page**: [https://github.com/gissehel/docker-sagemath](https://github.com/gissehel/docker-sagemath)

**registry page**: [https://registry.hub.docker.com/u/gissehel/sagemath/](https://registry.hub.docker.com/u/gissehel/sagemath/)

**Note**: This build is not an automated build because sagemath takes too much time to compile, the automated build timeout !

## Notes

* You need a bit more RAM than the standard Docker Vagrantfile gives you.
  I recommend at least 1 GB of RAM on your VM.
* The build takes a really long time, probably several hours.
* The builds take a lot of disk space (several GB).

## Usage

### Console interactive sage

```bash
$ sudo docker run -ti --name=isage gissehel/sagemath
```

### Http server

Define a folder on the host to store the notebook. For example (and all the above) /opt/dockerstore/notebook

Interactivey setup your server with the folder /opt/dockerstore/notebook mounted as /home/sage/notebook.sagenb : `sudo docker run -ti -rm -v /opt/dockerstore/notebook:/home/sage/notebook.sagenb gissehel/sagemath`

Then at prompt launch `notebook("/home/sage/notebook","8080","0.0.0.0")`

It will look like:

```bash
$ sudo docker run -ti -rm -v /opt/dockerstore/notebook:/home/sage/notebook.sagenb gissehel/sagemath
┌────────────────────────────────────────────────────────────────────┐
│ Sage Version 6.3, Release Date: 2014-08-10                         │
│ Type "notebook()" for the browser-based notebook interface.        │
│ Type "help()" for help.                                            │
└────────────────────────────────────────────────────────────────────┘
sage: notebook("/home/sage/notebook","8080","0.0.0.0")
```

Then once your folder has been initialised, every other starts will look like :

```bash
$ sudo docker run -d -v /opt/dockerstore/notebook:/home/sage/notebook.sagenb -p 127.0.0.1:8080:8080 --name=sage gissehel/sagemath -notebook /home/sage/notebook 8080 0.0.0.0
```





