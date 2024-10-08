**install_vmware_exporter**
docker pull docker pull pryorda/vmware_exporter
mkdir -p /etc/prometheus-docker/vmware_exporter
wget -P /etc/prometheus-docker/vmware_exporter/docker-compose.yml
wget -P /etc/prometheus-docker/vmware_exporter/config.yml
docker-compose -f /etc/prometheus-docker/vmware_exporter/docker-compose.yml up -d

##############

docker ps
docker logs vmware_exporter
http://<docker_host_ip>:9272/metrics
