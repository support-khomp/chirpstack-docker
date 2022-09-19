import-lorawan-devices:
	rm -rf lorawan-devices
	git clone https://github.com/support-khomp/lorawan-devices.git
	docker-compose run --rm chirpstack -c /etc/chirpstack import-ttn-lorawan-devices -d /opt/lorawan-devices