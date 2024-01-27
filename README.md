# Metabase Docker Image for Apple Silicon (ARM64) ⭐️

👋 Hey there! Are you using a MacBook Pro (M1, M2), MacBook Air, Mac Studio, or any other device powered by an ARM64 chip? Have you attempted to launch the official Metabase Docker image on these machines? If that's the case, you've likely stumbled upon poor performances and this warning:

> [!WARNING]
> _WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested_

🚫 No panic! I've got you covered. I've packaged the JAR file for Metabase OSS into a Docker image that runs like a charm on ARM64-based architecture, including those nifty machines with the Apple Silicon chip.

🚀 Let's jump right in on how to get started.

# How to run Metabase with Docker on ARM64 💻

**Pre-requisite**
- [Install Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/). Ensure to have Docker Desktop for Mac with Apple silicon installed and running in the background.

**Clone this repository into your project's folder**

In a terminal window, navigate to your project's folder and clone this repository
```
git clone https://github.com/StephaneTurquay/metabase-arm64-docker.git
```

**Pull the metabase-arm64 Docker image**
```
docker pull stephaneturquay/metabase-arm64
```


# Bonus: How to run Metabase & PostgreSQL with Docker on ARM64 🎉

`docker pull stephaneturquay/metabase-arm64`
