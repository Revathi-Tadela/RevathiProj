pipeline {
    agent any

    environment {
        DOCKER_CLI_EXPERIMENTAL = 'enabled'
        DOCKER_IMAGE_NAME = 'revathitadela1/rev'
        DEV_DOCKER_TAG = 'rev'
        PROD_DOCKER_TAG = 'prod'
        GIT_REPO = 'https://github.com/Revathi-Tadela/New_Project.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "${GIT_REPO}", branch: "${BRANCH_NAME}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Tag and push to 'dev' repo on Docker Hub
                    sh "docker tag ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ${DOCKER_IMAGE_NAME}:${DEV_DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE_NAME}:${DEV_DOCKER_TAG}"
                }
            }
        }

        stage('Push to Prod on Merge') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Tag and push to 'prod' repo on Docker Hub
                    sh "docker tag ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ${DOCKER_IMAGE_NAME}:${PROD_DOCKER_TAG}"
                    sh "docker push ${DOCKER_IMAGE_NAME}:${PROD_DOCKER_TAG}"
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

