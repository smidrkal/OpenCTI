# OpenCTI
Docker Compose template for a Security Analyst workstation to build working and usable (local) instance of http://opencti.io/ - an Open Threat Intelligence Platform.

This is not direclty my work, but bits and pieces glued together for my own use.
See [References](#References) at the bottom.

Some services may require registration, however aim of this build is to get the most information for $0 monthly fees.
Just add connectors for commercial services, like Intel471, according to your needs and budget.

> [!NOTE]
> *Update 202401:*
> Working on a minor cleanup + playing with adding additional services (e.g. MISP)

## Prerequisities

### Get Docker working.
Mandatory.

[Docker Desktop](https://www.docker.com/products/docker-desktop/) makes your life **much** easier.

### Get [Portainer CE](https://portainer.io/).
Optional, but highly suggested.

Deploying and especially editing container stack is much easier this way.

Howto, for example, https://docs.portainer.io/start/install/server/docker/wsl 

## Prepare for OpenCTI deployment

### Register for (Free) Services

#### Free Services requiring registration (API key)
* [AbuseIPDB](https://www.abuseipdb.com/account/api)
* [AlienVault OTX](https://otx.alienvault.com/api) - OTX = Open Threat eXchange
* [Malbeacon](https://www.malbeacon.com/register)
* ~[RiskIQ](https://community.riskiq.com/)~ - bought by Microsoft and turned into [Microsoft Defender Threat Intelligence](https://ti.defender.microsoft.com/); No new registrations possible, works for pre-Microsoft Defender TI accounts...
* [Shodan](https://account.shodan.io/)
* [VirusTotal](https://www.virustotal.com/) - virustotal.com/gui/user/-yourUsername-/apikey

### Working out-of-the-box
* AbuseSSL - downloads list and monitors https://sslbl.abuse.ch/
* ~AMITT~ (dead & removed)- download from https://github.com/VVX7/cti
* CISA KEV - download from https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json
* ~Cryptolaemus~ (dead & removed) - https://paste.cryptolaemus.com
* CVE - download from https://nvd.nist.gov/feeds/json/cve/1.1/
* Cyber Campaign Collection - download reports and monitor for new ones on https://github.com/CyberMonitor/APT_CyberCriminal_Campagin_Collections/tree/master/ 
* Disarm Framework - external import of https://raw.githubusercontent.com/DISARMFoundation/DISARMframeworks/main/generated_files/DISARM_STIX/DISARM.json
* Malpedia - https://malpedia.caad.fkie.fraunhofer.de/
* Malware Bazaar - taking data directly from https://mb-api.abuse.ch/api/v1/
* MITRE - downloaded from https://github.com/mitre/cti/
* Phishunt.io - known phishing sites. Free version gives you public feed of known phishing sites.
* OpenCTI Datasets - This connector collects data from the OpenCTI datasets repository in order to pre-populate your OpenCTI instance with information like the following:
  - companies (identity objects)
  - industry sectors (identity objects)
  - countries and regions (locations objects)
* ThreatFox - Downloads data from [Threat Fox Recent Feed](https://threatfox.abuse.ch/)
* URLHaus - CSV download from https://urlhaus.abuse.ch/downloads/csv_recent/
* VXVault - http://vxvault.net/URL_List.php
* Yara - connector enriches Artifact Observables by scanning their contents using every YARA Indicator in the system

## How to Use

### Download the repo. files
Mandatory.

`docker-compose.yml` and `.env.template` are all you need.

### Create .env
Mandatory.

- Move `.env.template` to `.env`
- add your values to `.env` (follow the comments in the file).

#### Optional: auto-generate UUIDs
Use the provided utils `gen-uuid-env.sh` or `gen-uuid-env.ps1`, according to the OS of your docker host, to auto-populate UUIDs in `.env` file.


> Note: some connectors require personal API keys for services requiring registration, see above.

### Deploy the stack

> [!WARNING]
>  to avoid Portainer error
> `toomanyrequests: You have reached your pull rate limit. You may increase the limit by authenticating and upgrading`
> consider pre-pulling the images using provided scripts under `utils` folder

Use `docker compose up` from the same directory where `docker-compose.yml` and `.env` are.



#### Or, highly suggested: Use Portainer CE
> **Note:** Portainer CE will allow you to easily edit/change stack configuration. Including addition/deletion of containers within the stack.

local -> Stacks -> (top-right) + Add stack <br> paste content of `docker-compose.yml` and import `.env`


![Portainer header](/docs/portainer-stacks-list.PNG)


### get coffee/tea...
just give it a few minutes (2..10) to download images, configure everything, download the data, etc.

If you cannot access http://localhost:8080 (or according to changes in your docker-compose.yml) after 10+ minutes and/or cannot see data being processed by the OpenCTI Connectors (opencti -> Data -> Connectors), then the coffee will aid you during troubleshooting.


![OpenCTI Connectors overview](/docs/opencti-connectors.PNG)

## Notes regarding MISP

If you don't have your own [MISP](https://www.misp-project.org/) instance, please consider `docker-compose-with-misp.yml` to test OpenCTI integration with your local *Malware Information Sharing Platform (MISP)*.

In order to propagate MISP Object into OpenCTI, per default configuration, you need to tag the object as either `opencti:import` (custom local tag, that you need to create) or `type:osint`. You can change this behavior in the `docker-compose-with-misp.yml` (e.g. to import all but specifically tagged).

![Tags in MISP for OpenCTI import](/docs/misp-tag-opencti_import.png)

![Showcase of OpenCTI imported MISP object](/docs/opencti-import-misp-object.png)

Primary aim of this repository is to allow easy initial test-drive/demo of OpenCTI Platform, so I am not going into depth with MISP here. I may however point you to a full 'Cyberstack' project with additional tools included (e.g. Wazuh, IntelOwl, Shuffle, etc.) in the future.

> [!NOTE]
> [NUKIB.cz MISP](https://github.com/NUKIB/misp) Docker Stack is used instead of the [Official Docker Image](https://github.com/MISP/misp-docker), provided by CIRCL.lu!
>
> In addition to the official images, NUKIB extended their image with additional functionality, working out-of-the-box - e.g. OpenID Connect, readyness for air-gapped deployments, etc.
>
> *NUKIB.cz and CIRCL.lu are working together on both Docker Images. I may switch to official docker image of CIRCL.lu in the future.*

> [!WARNING]
> OpenCTI `connector-misp` will fail to run, unless a working API key is provided.
>
> In order to provide working API key, you need your MISP instance up & running, users configured, and API key generated for the delegated user.
>
> Docker Stack deployment through Portainer allows you to edit the ENV variables for already deployed/running Stack.
>
> => Don't forget to add the right MISP API key for `connector-misp` & Update the Stack once you have your MISP container ready.

> [!TIP]
> You may want to load some (or all) [MISP Default Feeds](https://www.misp-project.org/feeds/) ([raw JSON](https://raw.githubusercontent.com/MISP/MISP/2.4/app/files/feed-metadata/defaults.json)) into your MISP to play with the available free CTI & OSINT data.
>
> MISP: Sync Actions -> Feeds -> Import Feeds from JSON 
> `http://localhost:8090/feeds/importFeeds`
>
> **Remember**:
> * Select only Feeds, that will provide you with added value! <br /> Some resources are already ingested into OpenCTI!
> * You still need to enable selected Feeds in order to obtain their data!
> * Consider periodical refresh of the feeds using a cron script!

## References
* example from docs: https://github.com/OpenCTI-Platform/connectors/blob/master/.circleci/config.yml
* VT connector article: https://medium.com/@zdsecurity/adding-internal-enrichment-virus-total-connector-in-opencti-b5d7d4e02476
* similar: https://github.com/Crypt-0n/OpenCTI/blob/master/3.yml
* DFIR connectors: https://www.iblue.team/opencti/configure-connectors
* https://github.com/OpenCTI-Platform/docker/blob/master/.env.sample
* list of connectors https://github.com/OpenCTI-Platform/connectors/tree/master/external-import
* similar: https://github.com/JMousqueton/OpenCTI-Docker

btw, https://www.maltego.com/transform-hub/opencti/
