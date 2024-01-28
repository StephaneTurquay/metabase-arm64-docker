# Metabase Docker Image for Apple Silicon (ARM64) ⭐️

👋 Hey there! Are you using a MacBook Pro (M1, M2), MacBook Air, Mac Studio, or any other device powered by an ARM64 chip? Have you attempted to launch the official Metabase Docker image on these machines? If that's the case, you've likely stumbled upon poor performances and this warning:

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
> The `-d` flag stands for "detached" mode. This means that the Docker container runs in the background of your terminal. It does not receive input or display output, allowing you to continue using the terminal while Metabase is running.

### Access Metabase from your browser
```
http://localhost:3000/
```
> [!NOTE]
> By default, Metabase runs on port 3000. If you have configured Metabase to run on a different port, make sure to adjust the URL accordingly.

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
If you need to switch from the default port 3000 to another port, such as port 4000, simply edit the [docker-compose.yml](docker-compose.yml) file in your preferred IDE, like Visual Studio Code. Change the line `"${PORT:-3000}:3000"` to `"${PORT:-4000}:4000"` to make Metabase accessible on the new port.


# Bonus: How to run Metabase & PostgreSQL with Docker on ARM64 🎉
