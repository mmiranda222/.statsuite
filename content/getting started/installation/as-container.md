---
title: Installation as Container(s)
subtitle: 
comments: false
weight: 26
---

This section describes how to install .Stat Suite services as container(s) using [Docker](https://www.docker.com/).<br>
**Note**: containerisation is commonly done with Docker containers and we will only explain here our most common scenarios using Docker Compose and our specific services and libraries.

## Principles

Containers ease developers' code and services' deployment in order to produce Docker images.<br>
Install Docker, then create containers hosting an application and its dependencies (e.g. lib and bins).<br>
Split your services into micro-services, isolate applications from each others, and Docker will help you packing and deploying the image(s) in an automated way.<br>
Create an image from a container. An image is a snapshot of your service(s). Images can be stored in a registry and IT operator can pick an image for deployment (to Dev, Staging or Prod).<br>
A good practice is to use the same image in different environments/containers.<br>

![container and docker infrastructure](/images/container-docker-infrastructure.png)

## References

Use **Docker** to build containers, each one dependent form the others. Multiples servcies (database, transfer API, share, config., etc...) implies scaling to multiple containers. Docker is installed in line with the [official Docker installation guidelines](https://docs.docker.com/install/overview/).<br>
Use **Docker Compose** to define and run a multi-container Docker application's services. Docker Compose is installed in line with the [official Docker Compose installation guidelines](https://docs.docker.com/compose/install/).<br>
