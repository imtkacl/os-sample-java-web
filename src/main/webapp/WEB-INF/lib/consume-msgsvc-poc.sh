i=0;while [ $i -lt 1 ];do
 echo $i;


java -jar -Djavax.net.ssl.keyStore=client.ks -Djavax.net.ssl.keyStorePassword=password -Djavax.net.ssl.trustStore=client.ks amqutil-0.1.0.jar consume 1000 --destination Performance$i.test --url "failover:(ssl://broker-tcp-ssl.msgsvc-poc.svc.cluster.local:61617)" --user amq-admin --password password --loglevel debug >> consume-mq.log &
i=`expr $i + 1`
done
