::REM This for pre-downloading current images to avoid
::REM "toomanyrequests: You have reached your pull rate limit. You may increase the limit by authenticating and upgrading"
::REM error on Portainer when deploying the stack
docker pull redis:7.2.0
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.9.1
docker pull minio/minio:RELEASE.2023-05-18T00-05-36Z
docker pull rabbitmq:3.12-management
docker pull opencti/platform:latest
docker pull opencti/worker:latest
docker pull opencti/connector-yara:latest
docker pull opencti/connector-export-file-stix:latest
docker pull opencti/connector-export-file-csv:latest
docker pull opencti/connector-export-file-txt:latest
docker pull opencti/connector-import-file-stix:latest
docker pull opencti/connector-import-document:latest
docker pull opencti/connector-virustotal:latest
docker pull opencti/connector-shodan:latest
docker pull opencti/connector-alienvault:latest
docker pull opencti/connector-abuseipdb:latest
docker pull opencti/connector-mitre:latest
docker pull opencti/connector-cve:latest
docker pull opencti/connector-vxvault:latest
docker pull opencti/connector-opencti:latest
docker pull opencti/connector-cisa-known-exploited-vulnerabilities:latest
docker pull opencti/connector-cyber-campaign-collection:latest
docker pull opencti/connector-malpedia:latest
docker pull opencti/connector-urlhaus:latest
docker pull opencti/connector-disarm-framework:latest
docker pull opencti/connector-threatfox:latest
docker pull opencti/connector-malwarebazaar-recent-additions:latest
docker pull opencti/connector-phishunt:latest
docker pull opencti/connector-abuse-ssl:latest
docker pull opencti/connector-misp:latest
docker pull mariadb:11.1
docker pull ghcr.io/nukib/misp-modules:latest
docker pull ghcr.io/nukib/misp:latest
