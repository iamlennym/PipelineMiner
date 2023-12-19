# Pipeline Miner
(Contains the Dockerfile etc to build the docker image for the Pipeline Miner)

## Description
Pipeline Miner is a powerful tool designed for searching through Harness pipelines using keywords. It serves as the 'grep' for Harness pipelines, allowing users to efficiently locate and reference pipelines within an account.

## Purpose
The primary function of this Docker image is to facilitate the search and identification of specific build steps or components within Harness pipelines. For instance, users can quickly find a pipeline utilizing tools like 'Sonarqube', which is particularly useful for referencing and replicating configurations.

## Key Features
- **Keyword Search:** Seamlessly search through Harness pipelines using keywords to find specific build steps or configurations.
- **Direct Navigation:** Provides the ability to click on a pipeline name to open the actual pipeline in Harness in a new tab, enhancing user experience and workflow efficiency.
- **Use Case Oriented:** Ideal for locating pipelines with specific tools or configurations, like 'Sonarqube', to serve as a reference or template.

## Requirements
- Docker installed on your machine.
- An active Harness account.
- A Service Account Token for secure access.

## Usage Instructions
1. Run the following docker command from the command line:
```
    docker run -p 13377:1337 iamlennym/pipelineminer:latest
```
2. Connect to http://localhost:13377 with your browser.
3. Follow the on-screen instructions to input your Harness account ID and the service account token. Once you click submit, PipelineMiner will contact the Harness manager and retrieve pipeline information to be cached.
4. Once done you will be able to perform keyword searches across pipelines within the account.

## Contact Information
For support, feedback, or any queries, feel free to contact Leendert Meyer at iamlennym@gmail.com.
