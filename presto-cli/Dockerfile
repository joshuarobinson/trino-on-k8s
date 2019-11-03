FROM openjdk:8-slim

# Install curl for the build process; will remove later.
RUN apt-get update && apt-get install -y curl less --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# https://prestosql.io/docs/current/installation/cli.html
ARG PRESTO_VER
RUN curl -o /opt/presto-cli https://repo1.maven.org/maven2/io/prestosql/presto-cli/$PRESTO_VER/presto-cli-$PRESTO_VER-executable.jar \
	&& chmod +x /opt/presto-cli

# Remove curl.
RUN apt-get --purge remove -y curl && apt-get autoremove -y
