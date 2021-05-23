#!/usr/bin/env bash

ANEMOMETER_HOST=''
ANEMOMETER_DB='anemometer'
ANEMOMETER_USER='collector'
ANEMOMETER_PASS=''

if [ -n "$1" ] && [ -f "$1" ]; then
	if [ -n "${ANEMOMETER_HOST}" ]; then
	  pt-query-digest --user=${ANEMOMETER_USER} --password=${ANEMOMETER_PASS} \
	      --review h=${ANEMOMETER_HOST},D=${ANEMOMETER_DB},t=global_query_review \
	      --history h=${ANEMOMETER_HOST},D=${ANEMOMETER_DB},t=global_query_review_history \
	      --no-report --limit=0% \
	      --filter=" \$event->{Bytes} = length(\$event->{arg}) and \$event->{hostname}=\"$HOSTNAME\"" \
	      "${1}" > /dev/null 2>&1
	else
    echo "It is necessary to edit this script in which you need to specify the data for connecting to the anemometer base..."
		exit 2
	fi
else
	echo "The script requires a command line argument which must be the path to the slow log file... "
  exit 1
fi
