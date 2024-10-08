# install_vmware_exporter
## Pull images vmware_exporter
`docker pull docker pull pryorda/vmware_exporter`
## Create path /etc/prometheus-docker/vmware_exporter
`mkdir -p /etc/prometheus-docker/vmware_exporter`
## Dowload config docker compose vmware_exporter
`wget -P /etc/prometheus-docker/vmware_exporter https://github.com/buithiendao/daobt/blob/4357550fade53c3d966dd1cb95f96f4c4506481f/docker-compose.yml`
## Dowload config user/pass vmware
`wget -P /etc/prometheus-docker/vmware_exporter https://github.com/buithiendao/daobt/blob/4357550fade53c3d966dd1cb95f96f4c4506481f/config.yml`
## Dowload config prometheus rules /etc/prometheus-docker/vmware_exporter
`wget -P /etc/prometheus-docker/vmware_exporter https://raw.githubusercontent.com/samber/awesome-prometheus-alerts/master/dist/rules/vmware/pryorda-vmware-exporter.yml`<br>
`docker-compose -f /etc/prometheus-docker/vmware_exporter/docker-compose.yml up -d`

##############

## Check docker vmware_exporter
docker ps<br>
docker logs vmware_exporter<br>
http://<docker_host_ip>:9272/metrics<br>
