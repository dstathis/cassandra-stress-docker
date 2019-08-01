# Local usage

```shell
docker build --tag chrisbelyea/cassandra-stress:latest .

docker network create scylla
docker create \
  --network scylla \
  --publish 9042:9042 \
  --publish 7199:7199 \
  --name scylla \
  scylladb/scylla:latest

docker run -d --network scylla chrisbelyea/cassandra-stress:latest write -node scylla
```
