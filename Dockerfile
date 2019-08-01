FROM ubuntu:bionic

# Install cURL
RUN apt-get update && apt-get --assume-yes install curl gnupg

# Add Cassandra repo
RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list && \
    curl https://www.apache.org/dist/cassandra/KEYS | apt-key add -

# Install Cassandra package
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install cassandra cassandra-tools
ENTRYPOINT ["cassandra-stress"]
