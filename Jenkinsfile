pipeline {
    
    agent { label 'docker' }

    stages {
        stage('Git Checkout') {
            
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Bhargavi-lakamsani/hello-world-war.git']])
                sh 'mvn clean package'
              
             }

        }
        stage('build stage') {
            
            steps {

                sh 'docker build -t tomcat:8.0-alpinenew1 .'
                
            }
        }
        stage('Push') {
            
            steps {
               sh 'docker tag tomcat:8.0-alpinenew1 590183706325.dkr.ecr.ap-south-1.amazonaws.com/docker:pipelinenew'
               sh 'docker push 590183706325.dkr.ecr.ap-south-1.amazonaws.com/docker:pipelinenew'
            }
        }
       
        stage('Deploy') {
           
            steps {
                
                sh 'docker run -d -p 8050:8080 tomcat:8.0-alpinenew1'
            }
        }
    }
}
