# aiven-kafka-demo

The client is modified from [sarama sasl sram client](https://github.com/Shopify/sarama/tree/master/examples/sasl_scram_client) and refers to the [getting started guide from aiven kafka](https://help.aiven.io/en/articles/489572-getting-started-with-aiven-kafka)

# How to run

## Run without SASL

```
make run-without-sasl
```

It works!

## Run with SASL PLAIN

```
make run-sasl-plain
```

It works with SASL authentication but fails to get metadata to broker.

Please see `sasl-plain.log`
