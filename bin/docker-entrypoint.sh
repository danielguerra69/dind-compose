#!/bin/sh

# read entrypoint.d configuration
for x in `find /etc/entrypoint.d -name '*.conf' | sort`;
do
		sh $x
done

exec "$@"
