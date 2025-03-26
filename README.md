# Metabase Docker Image for Apple Silicon (ARM64) ⭐️

#### ![ChatGPT_logo 24](https://github.com/StephaneTurquay/metabase-arm64-docker/assets/1861836/cf9e9839-968c-48d0-ad1b-a434762caa64) [Get some dedicated support with ChatGPT!](https://chat.openai.com/g/g-LMMixC7yA-metabase-docker-image-for-apple-silicon-arm64) 🤖  

👋 Hey there! Are you using a MacBook Pro (M1, M2, etc), MacBook Air, Mac Studio, or any other device powered by an ARM64 chip? Have you attempted to launch the official Metabase Docker image on these machines? If that's the case, you've likely stumbled upon poor performances and this warning:

> [!WARNING]
> _WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested_

🚫 No panic! I've got you covered. I've packaged the JAR file for Metabase OSS into a Docker image that runs like a charm on ARM64-based architecture, including those nifty machines with the Apple Silicon chip.

🚀 Let's jump right in on how to get started.

# How to run Metabase with Docker on ARM64 💻

## Pre-requisite
- [Install Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/). Ensure to have Docker Desktop for Mac with Apple silicon installed and running in the background.

## Quick install
### Clone this repository into your project's folder

In a terminal window, navigate to your project's folder and clone this repository
```
git clone https://github.com/StephaneTurquay/metabase-arm64-docker.git
```
 
### Pull the metabase-arm64 Docker image
```
docker pull stephaneturquay/metabase-arm64
```

### Run the Docker image, create and start the container

```
docker compose up metabase -d
```
> [!NOTE]
> The `-d` flag stands for "detached" mode. This means that the Docker container runs in the background of your terminal. It does not receive input or display output, allowing you to continue using the terminal while Metabase runs.

### Access Metabase from your browser
```
http://localhost:3000/
```
> [!NOTE]
> By default, Metabase runs on port 3000. If you have set up Metabase to run on a different port, make sure to adjust the URL accordingly.

## Install using custom settings
In the Quick Install section, we set up Metabase to run on port 3000 using a local H2 database. This setup is great for initial exploration, but it's important to note that the H2 database is primarily for trial purposes. It stores all your settings, questions, and dashboards, but isn't recommended for production use due to its limitations in scalability and durability. For more insights on why migrating from H2 is crucial for production environments, [check out this detailed guide on Metabase.com](https://www.metabase.com/docs/latest/installation-and-operation/migrating-from-h2).

### Clone this repository into your project's folder

In a terminal window, navigate to your project's folder and clone this repository
```
git clone https://github.com/StephaneTurquay/metabase-arm64-docker.git
```
 
### Pull the metabase-arm64 Docker image
```
docker pull stephaneturquay/metabase-arm64
```

### Define the port where Metabase will be accessible
If you need to switch from the default port 3000 to another port, such as port 4000, edit the [docker-compose.yml](docker-compose.yml) file in your preferred IDE, like Visual Studio Code, and update the code as follows:
```yml
version: '3.8'
services:
  metabase:
    image: stephaneturquay/metabase-arm64:latest
    ports:
      - "${PORT:-4000}:${PORT:-4000}"
    environment:
      MB_JETTY_PORT: "${PORT:-4000}"
```

### Use PostgreSQL, MySQL, or MariaDB to store Metabase's application settings
**Pre-requisite:** Ensure you have a running instance of PostgreSQL, MySQL, or MariaDB and possess the necessary credentials. You can find the minimum requirements and supported databases for Metabase here.

**Configuration Steps:**
1. Prepare Your Database Details: Gather the necessary information about your database — type, name, port, user, password, and host.
2. Edit docker-compose.yml: Open the docker-compose.yml file in your preferred IDE. You will be updating this file with your database information.
3. Update Database Settings: Locate the environment section under the metabase service. Replace the placeholder values with your actual database details. For `MB_DB_TYPE`, use `postgres`, `mysql`, or `mariadb`, depending on your database.

Here's an example configuration for PostgreSQL, building up on the example from the previous step:

```yml
version: '3.8'
services:
  metabase:
    image: stephaneturquay/metabase-arm64:latest
    ports:
      - "${PORT:-4000}:${PORT:-4000}"
    environment:
      MB_JETTY_PORT: "${PORT:-4000}"
      MB_DB_TYPE: "${DB_TYPE:-postgres}" # Change to mysql or mariadb as needed
      MB_DB_DBNAME: "${DB_NAME:-mydatabase}"
      MB_DB_PORT: "${DB_PORT:-5432}" # Adjust the port for MySQL/MariaDB
      MB_DB_USER: "${DB_USER:-myuser}"
      MB_DB_PASS: "${DB_PASS:-mypassword}"
      MB_DB_HOST: "${DB_HOST:-localhost}"
```

### Run the Docker image, create and start the container

```
docker compose up metabase -d
```

### Access Metabase from your browser
```
http://localhost:4000/
```

# Bonus: How to run Metabase & PostgreSQL with Docker on ARM64 🎉

For testing and cost purposes, you might want to run both Metabase and PostgreSQL locally. To do so, start by uncommenting all comments in [docker-compose.yml](docker-compose.yml):

```yml
version: '3.8'
services:
  metabase:
    image: stephaneturquay/metabase-arm64:latest
    ports:
      - "${PORT:-3000}:${PORT:-3000}"
    environment:
      MB_JETTY_PORT: "${PORT:-3000}"
      MB_DB_TYPE: "${DB_TYPE:-postgres}"
      MB_DB_DBNAME: "${DB_NAME:-metabaseappdb}"
      MB_DB_PORT: "${DB_PORT:-5432}"
      MB_DB_USER: "${DB_USER:-myuser}"
      MB_DB_PASS: "${DB_PASS:-mypassword}"
      MB_DB_HOST: "${DB_HOST:-db}"
    depends_on:
      - db

  db:
    image: postgres:latest
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: metabaseappdb
    volumes:
      - postgres-data:/var/lib/postgresql/data

volumes:
  postgres-data:
```

### Run the Docker image, create and start the container

This command will run both Metabase and PostgreSQL.

```
docker compose up metabase -d
```

> [!NOTE]
> - **Database Host:** Use db as the hostname. This refers to the PostgreSQL service defined in the docker-compose.yml, ensuring proper networking within Docker.
> - **Database Name:** By default, the PostgreSQL container initializes with a pre-configured database named `postgres`. It's recommended to use this database for storing your data.
> - **User Credentials:** Specify the username and password as defined in your docker-compose.yml file. These credentials are necessary for Metabase to establish a successful connection with the PostgreSQL database.
