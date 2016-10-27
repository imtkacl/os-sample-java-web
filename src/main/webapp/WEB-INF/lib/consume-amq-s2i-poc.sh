i=0;while [ $i -lt 1 ];do
 echo $i;


java -jar -Djavax.net.ssl.keyStore=broker.ks -Djavax.net.ssl.keyStorePassword=password -Djavax.net.ssl.trustStore=broker.ks amqutil-0.1.0.jar consume 1000 --destination Performance$i.test --url "failover:(ssl://broker-tcp-ssl.amq-s2i-poc.svc.cluster.local:61617)" --user amq-user --password password --loglevel debug >> consume-mq.log &
i=`expr $i + 1`
done
