default: test

test:
	cd example && flutter drive --target=test_driver/app.dart

upgrade: upgrade-libs upgrade-protobuf

upgrade-libs:
	./scripts/upgrade_bridge_libs.sh

upgrade-protobuf:
	./scripts/upgrade_bridge_protobuf.sh

example-web:
	docker build -t flutter-rsa-web -f example/Dockerfile .