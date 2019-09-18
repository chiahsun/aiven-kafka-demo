.PHONY: all curl init run

all: run-sasl

curl:
	curl -LO https://raw.githubusercontent.com/Shopify/sarama/master/examples/sasl_scram_client/scram_client.go
	curl -LO https://raw.githubusercontent.com/Shopify/sarama/master/examples/sasl_scram_client/main.go

init:
	go mod init aiven-kafka-demo

run-sasl:
	go run main.go scram_client.go -brokers kafka-126f65ba-chiahsun-7adf.aivencloud.com:16014 -username avnadmin -passwd jpm5joa17pb5sgwj -algorithm sha256 -topic partition-3 -certificate avnadmin.cert -key avnadmin.key -ca ca.pem -mode consume -logmsg true -verify true -tls true
	
