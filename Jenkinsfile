pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials' // Update with your DockerHub credentials ID
        DOCKERHUB_REPO = 'mukesh18s/crud-app' // Update with your DockerHub username and image name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the repository automatically using the Jenkins Git plugin
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure Docker is available
                    sh 'docker --version'
                    
                    // Build the Docker image
                    def app = docker.build("${DOCKERHUB_REPO}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        def app = docker.image("${DOCKERHUB_REPO}:${env.BUILD_ID}")
                        app.push("${env.BUILD_ID}")
                        app.push("latest")
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
            deleteDir() // Clean up workspace
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
