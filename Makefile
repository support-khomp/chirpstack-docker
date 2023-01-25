docker:
	docker-compose up

import:
	docker-compose run --rm --entrypoint bash --user root chirpstack -c '\
	apt-get update && \
	apt-get install -y make git && \
	git clone https://github.com/support-khomp/khomp-lorawan-devices.git /tmp/lorawan-devices && \
	chirpstack -c /etc/chirpstack import-legacy-lorawan-devices-repository -d /tmp/lorawan-devices'

token:
	sed -i 's/PASSWORD_PLACEHOLDER/$(TOKEN)/g' ./configuration/chirpstack/chirpstack.toml
	sed -i 's/ \# enabled=\[\"mqtt\"\]/enabled=\[\"mqtt\"\]/g' ./configuration/chirpstack/chirpstack.toml	
