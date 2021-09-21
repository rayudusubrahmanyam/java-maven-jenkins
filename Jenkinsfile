@Library("jenkins-shared-lib")_
pipeline {
    agent any
    stages {
        stage('Fetch Repository') {
            steps {
                script {
                    git branch: 'main', credentialsId: 'Github', url: 'https://github.com/rayudusubrahmanyam/java-maven-jenkins.git'
                }
            }
        }
        stage('Java Application Build') {
            steps {
                script {
                    buildJarFile()
                }
            }
        }
        stage('SonarQube Scanner') {
            steps {
                script {
                    sh 'mvn sonar:sonar'
                }
            }
        }        
        stage('Docker Image Build and Push') {
            steps {
                script {
                   buildDockerImage("rayudusubrahmanyam/myapp:$BUILD_NUMBER.0")
                   dockerLogin();
                   dockerPush("rayudusubrahmanyam/myapp:$BUILD_NUMBER.0");
                }
            }
        } 
    }
}


