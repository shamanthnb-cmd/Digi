pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'   // ID you created
        DOCKERHUB_USER = 'your-dockerhub-username'
        IMAGE_NAME = 'your-image-name'
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDENTIALS,
                                                    usernameVariable: 'USER',
                                                    passwordVariable: 'PASS')]) {
                        bat "echo $PASS | docker login -u $USER --password-stdin"
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    bat "docker push $DOCKERHUB_USER/$IMAGE_NAME:latest"
                }
            }
        }
    }

    post {
        always {
            bat 'docker logout'
        }
    }
}
