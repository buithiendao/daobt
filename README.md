**install_vmware_exporter**
docker pull docker pull pryorda/vmware_exporter
mkdir -p /etc/prometheus-docker/vmware_exporter
wget -P /etc/prometheus-docker/vmware_exporter/docker-compose.yml
wget -P /etc/prometheus-docker/vmware_exporter/config.yml
wget -P /etc/prometheus-docker/vmware_exporter https://raw.githubusercontent.com/samber/awesome-prometheus-alerts/master/dist/rules/vmware/pryorda-vmware-exporter.yml
docker-compose -f /etc/prometheus-docker/vmware_exporter/docker-compose.yml up -d

##############

docker ps
docker logs vmware_exporter
http://<docker_host_ip>:9272/metrics
