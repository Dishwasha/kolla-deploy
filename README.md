= git submodule update -i

= Add cobbler to /etc/hosts

= Create self-signed key
openssl req \
   -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
   -x509 -days 365 -out certs/domain.crt
cp certs/domain.crt /etc/docker/certs.d/cobbler:5000/ca.crt

cp certs/domain.crt /etc/pki/ca-trust/source/anchors/cobbler.crt
update-ca-trust

= Edit docker-cobbler/etc/cobbler/settings
Change next_server and & server to cobbler IP (10.0.0.2)

= Import CentOS
sudo mount -t iso9660 -o loop,ro -v docker-cobbler/dist/centos.iso docker-cobbler/dist/centos
docker-compose build cobbler
docker run -it cobbler cobbler import --name=centos7 --arch=x86_64 --path=/mnt

