#!/usr/bin/env bash

[ ! "$(ls /opt/patternlab-php/source)" ] \
	&& mkdir -p /opt/patternlab-php/source \
	&& cp -RPp /opt/patternlab-php/core/source/* /opt/patternlab-php/source/

exec $@