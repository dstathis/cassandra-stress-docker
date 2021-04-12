FROM ubuntu:focal

# Install cURL
RUN apt-get update && apt-get --assume-yes install curl gnupg

# Add Cassandra repo
RUN echo "deb http://downloads.apache.org/cassandra/debian 311x main" >> /etc/apt/sources.list.d/cassandra.sources.list
RUN curl https://downloads.apache.org/cassandra/KEYS | apt-key add -

# Install Cassandra package
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install cassandra cassandra-tools

# Install python3
RUN DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install python3

ENTRYPOINT ["cassandra-stress"]
