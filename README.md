# OpenCTI
Docker Compose template for a Security Analyst workstation to build working and usable (local) instance of http://opencti.io/ - an Open Threat Intelligence Platform.

## How to use

### 1. Get Docker working.
Mandatory.

[Docker Desktop](https://www.docker.com/products/docker-desktop/) makes your life **much** easier.

### 2. Get [Portainer CE](https://portainer.io/).
Optional, but highly suggested.

Deploying and especially editing container stack is much easier this way.

Howto, for example, https://docs.portainer.io/start/install/server/docker/wsl

### 4. Download the repo. files
Mandatory.

`docker-compose.yml` and `.env.template` are all you need.

### 5. Edit
Mandatory.

- Move `.env.template` to `.env`
- add your values to `.env` (follow the comments in the file).



### 6. Deploy the stack

Use `docker compose up` from the same directory where `docker-compose.yml` and `.env` are.



#### Or, highly suggested: Use Portainer CE
> **Note:** Portainer CE will allow you to easily edit/change stack configuration. Including addition/deletion of containers within the stack.

local -> Stacks -> (top-right) + Add stack <br> paste content of `docker-compose.yml` and import `.env`


![Portainer header](/docs/portainer-stacks-list.PNG)


### 8. get coffee/tea...
just give it a few minutes (2..10) to download images, configure everything, download the data, etc.

If you cannot access http://localhost:8080 (or according to changes in your docker-compose.yml) after 10+ minutes and/or cannot see data being processed by the OpenCTI Connectors (opencti -> Data -> Connectors), then the coffee will aid you during troubleshooting.


![OpenCTI Connectors overview](/docs/opencti-connectors.PNG)
