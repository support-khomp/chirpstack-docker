import-lorawan-devices:
	rm -rf lorawan-devices
	git clone https://github.com/support-khomp/khomp-lorawan-devices.git lorawan-devices
	docker-compose run --rm chirpstack -c /etc/chirpstack import-ttn-lorawan-devices -d /opt/lorawan-devices
	
set_token:
    sed -i 's/PASSWORD_PLACEHOLDER/$(TOKEN)/g' ./configuration/chirpstack/chirpstack.toml
    sed -i 's/ \# enabled=\[\"mqtt\"\]/enabled=\[\"mqtt\"\]/g' ./configuration/chirpstack/chirpstack.toml
