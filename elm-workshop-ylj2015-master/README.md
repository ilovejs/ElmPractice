# Elm Workshop

## Setup - the docker way

- Clone this repository - this is where we'll be doing our work

- Ensure docker is installed and configured properly

- Pull the docker image

        docker pull leonardoborges/elmworkshop
    
- Run the container    

        docker run --net=host -v $PWD:/elm-workshop -w /elm-docs leonardoborges/elmworkshop
  
  
This will setup a new docker container exposing two ports: 3000 and 8000

- `http://$CONTAINER_IP:8000/` - Has elm-reactor running with a sample Hello.elm file. Click on it and try it out
- `http://$CONTAINER_IP:3000/` - Has offline docs for Elm's core libraries



Theoretically once you have this setup, you shouldn't need internet connection anymore. Let me know if you find issues.



### Mac and Windows users

You need to to setup [boot2docker](http://boot2docker.io/) before you can setup docker.

Additionally, under windows and mac environments, the container has limited access to your filesystem so make sure to clone this project somewhere in your home directory.

On Mac OS X you can install `docker` and `boot2docker` using [homebrew](http://brew.sh):

```sh
brew install docker boot2docker
boot2docker init
boot2docker start
```

In order access the applications on ports 3000 and 8000 on the host system, you will need to port forward ports 3000 and 8000 through VirtualBox from the boot2docker image to the host system.

Go to VirtualBox > boot2docker-vm > Settings > Network > Port Forwarding and add the following rules:

1. Protocol:TCP, Host Ip:127.0.0.1, Host Port:3000, Guest Port:3000
2. Protocol:TCP, Host Ip:127.0.0.1, Host Port:8000, Guest Port:8000

Then continue the setup as described above.

## Setup - non-docker way


Mac and Windows have binaries [here](http://elm-lang.org/Install.elm). For Linux you will need to build from source so I highly recommend using the docker setup described above.

Regardless of operating system however, the docker image also includes offline documentation which is desired for a workshop as internet access is limited.

If you choose this path, be aware you might not be able to access the docs during the workshop, unless you can use some form of tethering.
