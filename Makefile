TARGET = TV-Samsung-Emulator
PACKAGE = Utz81nMLJp
NAME = ReactTizenApp
CERTIFICATE = Tivi

build:
	npx react-scripts build
	cp icon.png config.xml build
	tizen build-web --output ../.buildResult -- build

start:
	tizen package --type wgt --sign $(CERTIFICATE) -- .buildResult
	tizen install --name $(NAME).wgt --target $(TARGET) -- .buildResult
	tizen run --pkgid $(PACKAGE).$(NAME) --target $(TARGET)
