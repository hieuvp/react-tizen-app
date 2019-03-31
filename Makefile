APP_NAME = ReactTizenApp
PACKAGE_ID = Utz81nMLJp
DEVICE_NAME = TV-Samsung-Emulator
CERTIFICATE_PROFILE = Tivi

build:
	npx react-scripts build
	cp icon.png config.xml build
	tizen build-web --output ../.buildResult -- build
	tizen package --type wgt --sign $(CERTIFICATE_PROFILE) -- .buildResult

start:
	tizen install --name $(APP_NAME).wgt --target $(DEVICE_NAME) -- .buildResult
	tizen run --pkgid $(PACKAGE_ID).$(APP_NAME) --target $(DEVICE_NAME)

uninstall:
	tizen uninstall --pkgid $(PACKAGE_ID).$(APP_NAME) --target $(DEVICE_NAME)
