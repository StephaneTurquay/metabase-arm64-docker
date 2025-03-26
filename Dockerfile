FROM eclipse-temurin:21-jre

WORKDIR /usr/src/metabase

# Default to 'latest' if not passed via --build-arg
ARG METABASE_VERSION=latest

RUN apt-get update && apt-get install -y curl && \
    curl -L https://downloads.metabase.com/${METABASE_VERSION}/metabase.jar -o metabase.jar && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["java", "--add-opens", "java.base/java.nio=ALL-UNNAMED", "-jar", "metabase.jar"]