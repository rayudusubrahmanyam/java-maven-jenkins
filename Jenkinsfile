@Library("jenkins-shared-lib")_
pipeline {
    agent any
    stages {
        stage('Fetch Repository') {
            steps {
                git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/rayudusubrahmanyam/java-maven-jenkins.git'
                  }
        }
        stage('Java Application Build') {
            steps {
                script {
                    buildJarFile()
                }
            }
        }
        stage('Docker Image Build and Push') {
            steps {
                script {
                   buildDockerImage("rayudusubrahmanyam/myapp:$BUILD_NUMBER.0")
                }
            }
        } 
    }
}


