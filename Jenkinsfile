pipeline {
    agent any
    
    stages {
        stage('Build Backend') {
            steps {
                script {
                    // Checkout code from GitHub
                    checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/sudharsudhar/GKE_application_test.git']]])

                    // Build Docker image for backend
                    sh 'docker build -t gcr.io/glass-handler-404405/backend:latest backend/'
                }
            }
        }
        stage('Push Backend to Registry') {
            steps {
                script {
                    // Push Docker image to GCR
                    sh 'docker push gcr.io/glass-handler-404405/backend:latest'
                }
            }
        }
        stage('Deploy Backend to GKE') {
            steps {
                script {
                    // Trigger rolling restart of GKE deployment for backend
                    sh 'kubectl rollout restart deployment backend'
                }
            }
        }
        
        stage('Build Frontend') {
            steps {
                script {
                    // Build Docker image for frontend
                    sh 'docker build -t gcr.io/glass-handler-404405/frontend:latest frontend/'
                }
            }
        }
        stage('Push Frontend to Registry') {
            steps {
                script {
                    // Push Docker image to GCR
                    sh 'docker push gcr.io/glass-handler-404405/frontend:latest'
                }
            }
        }
        stage('Deploy Frontend to GKE') {
            steps {
                script {
                    // Trigger rolling restart of GKE deployment for frontend
                    sh 'kubectl rollout restart deployment frontend'
                }
            }
        }
    }
}
