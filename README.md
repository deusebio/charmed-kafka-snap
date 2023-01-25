# charmed-kafka-snap

Charmed Kafka snap repository.

This snap is based on the kafka snap: https://git.launchpad.net/kafka-snap/

## Building

To build locally, use `snapcraft --debug`

## Using the snap

Install the snap (e.g., sudo snap install ./kafka_3.1.0_amd64.snap --dangerous
--devmode).

You can run kafka with `snap start charmed-kafka` once the snap is installed.
In a seperate shell, you can also run zookeeper with `snap start charmed-kafka.zookeeper`.

### Hello, Kafka

As per https://kafka.apache.org/quickstart run:

```
charmed-kafka.topics --create --topic quickstart-events --bootstrap-server localhost:9092
charmed-kafka.topics --describe --topic quickstart-events --bootstrap-server localhost:9092
charmed-kafka.console-producer --topic quickstart-events --bootstrap-server localhost:9092
```

Write any data to the topic, then halt with `ctrl-C`.

```
charmed-kafka.console-consumer --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```

Logs should be available at `/var/snap/charmed-kafka/common/log`.

### Configuration

Place your custom kafka configuration in the snap common directory at
`/var/snap/charmed-kafka/common/server.properties`. If such configuration is not
available, the default upstream configuration will be used.

Place your custom zookeeper configuration in the snap common directory at
`/var/snap/charmed-kafka/common/zookeeper.properties`. If such configuration is not
available, the default upstream configuration will be used.

If you want to use custom log4j properties, place your custom log4j properties
file at the snap common directory at `/var/snap/charmed-kafka/common/log4j.properties`.

To load additional environment variables for kafka, define your environment
variables in a new file at `/var/snap/charmed-kafka/common/broker.env`.
