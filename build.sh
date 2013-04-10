#!/bin/bash

./sbt "++2.8.0 package"
./sbt make-pom

# delete this once we get the pom in order
echo "Fix pom and deploy Kafka core..."
sed -e '<artifactId>kafka_2.8.0<\/artifactId>$/<artifactId>kafka<\/artifactId>/g;' -i "" core/target/scala-2.8.0/kafka_2.8.0-0.8-SNAPSHOT.pom
#mvn deploy:deploy-file  -Dfile=./core/target/scala-2.8.0/kafka_2.8.0-0.8-SNAPSHOT.jar -Dpackaging=jar -e -DpomFile=./core/target/scala-2.8.0/kafka_2.8.0-0.8-SNAPSHOT.pom -Durl=http://bucasit-build.corp.adobe.com:8081/nexus/content/repositories/snapshots -DrepositoryId=bucasit-build.snapshots
