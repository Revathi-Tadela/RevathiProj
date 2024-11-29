pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'revathitadela1/rev'
        DEV_REPO = 'rev'
        PROD_REPO = 'prod'
        GIT_CREDENTIALS = '<Jenkins-GitHub-Credential-ID>'
        DOCKER_CLI_EXPERIMENTAL = 'enabled'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Revathi-Tadela/RevathiProj.git', branch: 'dev'
                    branch: env.BRANCH_NAME, credentialsId: "${GIT_CREDENTIALS}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    sh "docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKER_IMAGE}:${DEV_REPO}"
                    sh "docker push ${DOCKER_IMAGE}:${DEV_REPO}"
                }
            }
        }

        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh "docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKER_IMAGE}:${PROD_REPO}"
                    sh "docker push ${DOCKER_IMAGE}:${PROD_REPO}"
                }
            }
        }
    }
}

