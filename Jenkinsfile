pipeline {
    agent any

    environment {
        GCP_PROJECT_ID = 'glass-handler-404405'
        GCR_REGISTRY = "gcr.io/${GCP_PROJECT_ID}"
        GCP_CREDENTIALS_ID = '79678c88-89d8-47b2-a06c-88f19118b6d6'
        FRONTEND_NAMESPACE = 'frontend'
        BACKEND_NAMESPACE = 'backend'
        REPO_URL = 'https://github.com/sudharsudhar/GKE_application_test.git'
        BRANCH_NAME = 'main'
    }

    stages {
        stage('Check Docker') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: BRANCH_NAME]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: REPO_URL]]])
            }
        }

        stage('Build and Push Frontend Image') {
            when {
                changeset "**/frontend/*"
            }
            steps {
                script {
                    docker.withRegistry('https://gcr.io', GCP_CREDENTIALS_ID) {
                        def frontendImage = docker.build("${GCR_REGISTRY}/frontend:${env.BUILD_NUMBER}", './frontend')

                        frontendImage.push()

                        // Trigger rollout restart for frontend namespace
                        sh "kubectl rollout restart deployment -n ${FRONTEND_NAMESPACE}"
                    }
                }
            }
        }

        stage('Build and Push Backend Image') {
            when {
                changeset "**/backend/*"
            }
            steps {
                script {
                    docker.withRegistry('https://gcr.io', GCP_CREDENTIALS_ID) {
                        def backendImage = docker.build("${GCR_REGISTRY}/backend:${env.BUILD_NUMBER}", './backend')

                        backendImage.push()

                        // Trigger rollout restart for backend namespace
                        sh "kubectl rollout restart deployment -n ${BACKEND_NAMESPACE}"
                    }
                }
            }
        }
    }
}
