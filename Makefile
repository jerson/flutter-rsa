default: test

test:
	cd example && flutter drive --target=test_driver/app.dart

upgrade: upgrade-libs upgrade-flatbuffers

upgrade-libs:
	./scripts/upgrade_bridge_libs.sh

upgrade-flatbuffers:
	./scripts/upgrade_bridge_flatbuffers.sh

example-web:
	docker build -t flutter-rsa-web -f example/Dockerfile .