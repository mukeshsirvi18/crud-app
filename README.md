
# Project Title

A Jenkinsfile for deploying a composefile to a github application



## Deployment

To deploy this project run

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the GitHub repository
                git branch: 'main', url: 'https://github.com/mukeshsirvi18/crud-app.git'
            }
        }
        
        stage('Build and Deploy') {
            environment {
                DOCKER_COMPOSE_VERSION = '1.29.0' // Define the Docker Compose version
            }
            steps {
             
                // Build and deploy using Docker Compose
                dir('crud-app') { // Change to the application directory
                    sh 'docker-compose up --build -d'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}



## Documentation


This is a declarative pipeline to deploy a application via jenkins .
This Jenkins pipeline script is designed to automate the deployment process for a CRUD application using Docker Compose. Here's a breakdown of what each part of the script does:

Pipeline Definition:

pipeline { agent any }: Specifies that this pipeline can run on any available agent.
Stages:

Checkout: Checks out the source code from the specified GitHub repository (https://github.com/mukeshsirvi18/crud-app.git) and branch (main).

git branch: 'main', url: 'https://github.com/mukeshsirvi18/crud-app.git': Uses the Git plugin to perform the checkout.
Build and Deploy: Builds and deploys the application using Docker Compose.

environment { DOCKER_COMPOSE_VERSION = '1.29.0' }: Sets an environment variable DOCKER_COMPOSE_VERSION to specify the Docker Compose version to be used.
dir('crud-app') { sh 'docker-compose up --build -d' }: Changes the directory to crud-app and then runs docker-compose up --build -d to build and deploy the application in detached mode (-d).
Post-build Actions:

post { success { ... } failure { ... } }: Defines actions to be taken after the build.
success { echo 'Deployment successful!' }: Echoes a message if the deployment is successful.
failure { echo 'Deployment failed!' }: Echoes a message if the deployment fails.
This script assumes that you have Docker and Docker Compose installed on the Jenkins agent where this pipeline is executed. It also assumes that the docker-compose.yml file for the application is configured correctly within the crud-app directory.

