# OpenCTI
Docker Compose template for a Security Analyst workstation to build working and usable (local) instance of http://opencti.io/ - an Open Threat Intelligence Platform.

## How to use

1. Get Docker working.
<br> [Docker Desktop](https://www.docker.com/products/docker-desktop/) makes your life **much** easier.
2. Get [Portainer CE](https://portainer.io/).
<br> Deploying and especially editing container stack is much easier this way.
<br> How to, for example, https://docs.portainer.io/start/install/server/docker/wsl
4. Download `docker-compose.yml` and `.env.template`.
5. Rename `.env.template` to `.env` and add your values (follow the comments in the file).
6. Use `docker compose up` from the same directory where `docker-compose.yml` and `.env` are.
<br> **Or**, ___highly suggested___: Use Portainer CE
<br> local -> Stacks -> (top-right) + Add stack <br> paste content of `docker-compose.yml` and import `.env`
7. get coffee/tea... just give it a few minutes (2..10) to download images, configure everything, download the data, etc.
