pipeline {
  agent any
  environment {
    DOCKER_HUB_USERNAME = 'revathitadela1'  // Your Docker Hub username
    IMAGE_NAME = 'devops-build'             // Docker image name
  }
  stages {
    stage('Build Docker Image') {
      steps {
        script {
          // Set the image tag for prod and dev1 environments
          def imageTag = env.BRANCH_NAME == 'master' ? 'prod-latest' : 'dev1-latest'
          sh "docker build -t ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${imageTag} ."
        }
      }
    }
    stage('Push to Docker Hub') {
      steps {
        script {
          // Push the Docker image to Docker Hub with the appropriate tag
          docker.withRegistry('', 'dockerhub-credentials') {
            def imageTag = env.BRANCH_NAME == 'master' ? 'prod-latest' : 'dev1-latest'
            sh "docker push ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${imageTag}"
          }
        }
      }
    }
    stage('Deploy to Server') {
      steps {
        script {
          // Run deploy script to deploy the image to the server
          sh './deploy.sh'
        }
      }
    }
  }
}

