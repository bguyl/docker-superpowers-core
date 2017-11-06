# Superpowers-core Docker image

This is a docker image for host a Superpowers-core server. Obviously.

[Superpowers](http://superpowers-html5.com) is a great opensource game engine, and one of the best feature is live collaboration !  
But you need a server to host the tool. You can host one on your computer, on a server your rent or even on your Raspberry Pi.  
And if you're comfortable with [Docker](https://docker.com), this is the fastest way to run one.

## Run it quick

```bash
docker run -d -p 4237:4237 -p 4238:4238 --name superpowers -v projects:/superpowers-core/projects -e PASSWORD=your_password bguyl/superpowers-core
```

**Please**, replace "your_password" by your actual password.  
Sometimes in the rush, you tend to forget it.

Set your firewall to accept 4237 and 4238 TCP ports and that's all, your good to go !

## Run as a test

So, you want to run a container in local, just to see what's happen. You don't need all theses fancy options:

```bash
docker run -p 4237:4237 -p 4238:4238 --name sp-test bguyl/superpowers-core
```

Then open *Superpowers* and connect to `127.0.0.1` with the password `unsecure`.

## Stop, restart, delete

If you don't know Docker very well, here is few common commands.  
Use `sp-test` instead of `superpowers` for the test container.

`docker ps` display the list of running containers. `-a` option will also show you the stopped ones.

`docker stop superpowers` will stop the container. You don't lose any data.

`docker start superpowers` will restart the container.

`docker exec -it superpowers /bin/sh` allow you to run an interactive shell in your container. Usefull when

`docker rm superpowers` will remove the container. You will loose all data in this container except the `projects` folder if you specified the `-v` option.

`docker images` display the list of images.

`docker rmi bguyl/superpowers-core` will remove the image and free some space in your disk. You'll need to download it again if you want to run another container.

## Need explanations?

`docker run bguyl/superpowers-core` will create a container from the bguyl/superpowers-core image. Put options **before** the image name.

`-d` option mean detach. So you can continue to interract with your server.

`-p 4237:4237 -p 4238:4238` option will link theses port of the container to your host. It's needed to work properly.

`--name superpowers` option will just give a nice name to your container, so you can stop it for example (``docker stop superpowers`). It's optionnal.

`-v projects:/superpowers-core/projects` option will link the projects folder on your host to the project folder in your container. If you don't do this, you will lost your project everytime you remove your container.

`-e PASSWORD=your_password` option is to specify a server password. You can't run a superpowers server if it doesn't have a password. If you don't specify this option, the password will be "unsecure". I mean, this will be litteraly the server password, so change it. And please, don't use "your_password".

## Want moar?

- This image should run on Raspberry Pi. (yes, Docker is available on RPi)
- This image embedded the superpowers core and only the game library.
- This image target only the lastet superpowers-core release.

Feel free to open a github issue if you want moar.