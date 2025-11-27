pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'   // ID you created
        DOCKERHUB_USER = 'your-dockerhub-username'
        IMAGE_NAME = 'your-image-name'
    }
    triggers {
        githubPush()
    }

    stages {

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t shamanth123/my-demo-app:12 ."
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
                    bat "docker push shamanth123/my-demo-app:latest"
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
