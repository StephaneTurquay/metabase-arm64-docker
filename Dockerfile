# Use Java 21 with multi-architecture support (including ARM)
FROM eclipse-temurin:21-jre

# Set the working directory in the container
WORKDIR /usr/src/metabase

# Download the latest Metabase JAR from the official source
RUN apt-get update && apt-get install -y curl && \
    curl -L https://downloads.metabase.com/latest/metabase.jar -o metabase.jar && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Run Metabase when the container launches
CMD ["java", "--add-opens", "java.base/java.nio=ALL-UNNAMED", "-jar", "metabase.jar"]