---
title: "Short introduction to Docker"
subtitle: 
comments: false
weight: 51

---

Docker is an open platform for developers and sysadmins for developing, shipping, deploying, and running applications with containers. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

A Docker **image** is a read-only template with instructions for creating a Docker container. You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

A Docker **container** is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state. By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container’s network, storage, or other underlying subsystems are from other containers or from the host machine. A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that are not stored in persistent storage disappear.

![container and docker infrastructure](/dotstatsuite-documentation/images/container-docker-infrastructure.png)

See the full Docker overview [here](https://docs.docker.com/engine/docker-overview/).

---

## Next steps

- Read about installing [Docker](https://docs.docker.com/install/overview/).  
- Get hands-on experience with the Getting started with [Docker tutorial](https://docs.docker.com/engine/getstarted/).  
- Check out examples and deep dive topics in the [Docker Engine user guide](https://docs.docker.com/engine/userguide/).  

---
