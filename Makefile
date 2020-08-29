
#!/usr/bin/make -f

SHELL := /bin/bash


debs:
	mkdir -p build
	chmod -R 777 build
	docker run -ti -e RUN_UID=$$(id -u) -v $$(pwd)/build:/home/bob phlax/debian-build bash -c "\
		sudo apt-get update \
		&& apt-src install ebtables=2.0.11-4 \
		&& export DEBFULLNAME='Bob the builder' \
		&& cd ebtables-*/ \
		&& chmod -x debian/docs \
		&& dpkg-buildpackage -us -uc"
