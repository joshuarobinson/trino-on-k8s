FROM openjdk:8-slim

RUN apt-get update && apt-get install -y curl python --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# Download and extract the Presto package.
# https://prestosql.io/docs/current/installation/deployment.html
ARG PRESTO_VER
RUN curl https://repo1.maven.org/maven2/io/prestosql/presto-server/$PRESTO_VER/presto-server-$PRESTO_VER.tar.gz \
	| tar xvz -C /opt/  \
	&& ln -s /opt/presto-server-$PRESTO_VER /opt/presto-server \
	&& mkdir -p /opt/presto-server/etc \
	&& mkdir -p /opt/presto-server/etc/catalog

# Copy only generic configs into image. All other configs should be later injected into the image.
COPY jvm.config /opt/presto-server/etc/jvm.config
COPY tpcds.properties /opt/presto-server/etc/catalog/tpcds.properties
COPY memory.properties /opt/presto-server/etc/catalog/memory.properties

# Copy script to automatically generate the remaining configs at launch time.
COPY autoconfig_and_launch.sh /opt/autoconfig_and_launch.sh
RUN chmod a+x /opt/autoconfig_and_launch.sh
