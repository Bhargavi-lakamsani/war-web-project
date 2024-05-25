pipeline {
     agent { label 'docker' }
    
    environment {
        AWS_REGISTRY_CREDENTIALS = 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 590183706325.dkr.ecr.ap-south-1.amazonaws.com'
        ECR_REGISTRY_URL = '590183706325.dkr.ecr.ap-south-1.amazonaws.com/docker'
        DOCKER_IMAGE_NAME = 'tomcat'
        DOCKER_IMAGE_TAG = "${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Bhargavi-lakamsani/war-web-project.git']])
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .'
            }
        }
        
        stage('Push') {
            steps {
                  sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $ECR_REGISTRY_URL"
               
                 sh "docker tag $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG $ECR_REGISTRY_URL:$DOCKER_IMAGE_TAG"
                sh "docker push $ECR_REGISTRY_URL:$DOCKER_IMAGE_TAG"
            }
        }
        
        stage('Deploy') {
            steps {
                
                sh "docker run -d -p 8080:8080 $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"
            }
        }
    }
}
