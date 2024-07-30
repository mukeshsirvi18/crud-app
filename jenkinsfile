pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mukeshsirvi18/crud-app'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("mukesh18s/crud-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        app.push()
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
