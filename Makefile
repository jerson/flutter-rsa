default: test

test:
	flutter drive --target=test_driver/app.dart

upgrade: upgrade-libs upgrade-protobuf

upgrade-libs:
	./scripts/upgrade_bridge_libs.sh

upgrade-protobuf:
	./scripts/upgrade_bridge_protobuf.sh
