.PHONY: all curl init run

BROKER?=kafka-126f65ba-chiahsun-7adf.aivencloud.com:16014
SASL_BROKER?=kafka-126f65ba-chiahsun-7adf.aivencloud.com:16025

USERNAME?=avnadmin
PASSWORD?=jpm5joa17pb5sgwj
CERT?=avnadmin.cert
KEY?=avnadmin.key

#all: run-without-sasl
#all: run-sasl-sha256
all: run-sasl-plain

curl:
	curl -LO https://raw.githubusercontent.com/Shopify/sarama/master/examples/sasl_scram_client/scram_client.go
	curl -LO https://raw.githubusercontent.com/Shopify/sarama/master/examples/sasl_scram_client/main.go

init:
	go mod init aiven-kafka-demo

run-without-sasl:
	go run main.go scram_client.go -brokers $(BROKER) -topic partition-3 -certificate service.cert -key service.key -ca ca.pem -mode consume -logmsg -verify -tls

run-sasl-sha256:
	go run main.go scram_client.go -brokers $(SASL_BROKER) -username $(USERNAME) -passwd $(PASSWORD) -algorithm sha256 -topic partition-3 -certificate $(CERT) -key $(KEY) -ca ca.pem -mode consume -logmsg -verify -tls -sasl

run-sasl-sha512:
	go run main.go scram_client.go -brokers $(SASL_BROKER) -username $(USERNAME) -passwd $(PASSWORD) -algorithm sha512 -topic partition-3 -certificate $(CERT) -key $(KEY) -ca ca.pem -mode consume -logmsg -verify -tls -sasl


run-sasl-plain:
	go run main.go scram_client.go -brokers $(SASL_BROKER) -username $(USERNAME) -passwd $(PASSWORD) -algorithm plain -topic partition-3 -certificate $(CERT) -key $(KEY) -ca ./ca.pem -mode consume -logmsg -verify -tls -sasl
	#go run main.go scram_client.go -brokers $(BROKER) -username avnadmin -passwd jpm5joa17pb5sgwj -algorithm plain -topic partition-3 -certificate ./avnadmin.cert -key ./avnadmin.key -ca ./ca.pem -mode consume -logmsg -verify -tls -sasl
