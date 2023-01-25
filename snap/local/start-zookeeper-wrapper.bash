#!/bin/bash

set -eu

export CONFIG_FILE="${SNAP_COMMON}/zookeeper.properties"
if [ ! -f "${CONFIG_FILE}" ]; then
	echo "custom configuration file ${CONFIG_FILE} does not exist."
	echo "Using default config ${CONFIG_FILE}"
	export CONFIG_FILE="${SNAP}/opt/kafka/config/zookeeper.properties"
fi

export PATH="${SNAP}/usr/lib/jvm/default-java/bin:${PATH}"
export LOG_DIR="${SNAP_COMMON}/log"

"${SNAP}/opt/kafka/bin/zookeeper-server-start.sh" "${CONFIG_FILE}"
