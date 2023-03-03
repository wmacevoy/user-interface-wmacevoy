MAKEFILE_DIR:=$(shell cd "$(dir $(firstword $(MAKEFILE_LIST)))" && pwd)
ANDROID_SDK=${HOME}/Library/Android/sdk
JAVA_HOME=/Applications/Android Studio.app/Contents/jbr/Contents/Home
ANDROID_SDK_MANAGER=$(ANDROID_SDK)/tools/bin/sdkmanager
FLUTTER_DIR:=$(MAKEFILE_DIR)/env/flutter

PATH  := $(ANDROID_SDK)/tools:$(ANDROID_SDK)/tools/bin:$(ANDROID_SDK)/platform-tools:$(FLUTTER_DIR)/bin:${PATH}

DART:= PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" $(FLUTTER_DIR)/bin/dart
FLUTTER:= PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" $(FLUTTER_DIR)/bin/flutter

flutter-doctor:
	$(FLUTTER) doctor

flutter-upgrade:
	$(FLUTTER) upgrade

.PHONY: app
app:
	if [ ! -d "$(MAKEFILE_DIR)/app" ] ; then $(FLUTTER) create app ; fi
	cd "$(MAKEFILE_DIR)/app" && $(DART) pub add --dev test

app-test: app
	cd "$(MAKEFILE_DIR)/app" && $(FLUTTER) test

app-code:
	cd "$(MAKEFILE_DIR)/app" && code .
