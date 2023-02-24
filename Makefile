MAKEFILE_DIR:=$(shell cd "$(dir $(firstword $(MAKEFILE_LIST)))" && pwd)
ANDROID_SDK=${HOME}/Library/Android/sdk
JAVA_HOME=/Applications/Android Studio.app/Contents/jbr/Contents/Home
ANDROID_SDK_MANAGER=$(ANDROID_SDK)/tools/bin/sdkmanager
FLUTTER_DIR:=$(MAKEFILE_DIR)/env/flutter
DART:= PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" $(FLUTTER_DIR)/bin/dart
FLUTTER:= PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" $(FLUTTER_DIR)/bin/flutter

SHELL := /bin/bash
PATH  := $(ANDROID_SDK)/tools:$(ANDROID_SDK)/tools/bin:$(ANDROID_SDK)/platform-tools:$(FLUTTER_DIR)/bin:${PATH}

doctor:
	PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" flutter doctor

.PHONY: licenses
licenses:
	PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" flutter doctor --android-licenses

test:
	PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" cd cli && dart test
go_moon:
	$(FLUTTER) create go_moon
hello:
	$(FLUTTER) create hello
go_moon_code: go_moon
	cd go_moon && PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" code .
hello_code: hello
	cd hello && PATH="$(PATH)" JAVA_HOME="$(JAVA_HOME)" code .

