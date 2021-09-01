@Library("jenkins-shared-lib")_
pipeline {
    agent any
    stages {
        stage('Fetch Repository') {
            steps {
                script {
                    fetchRepo('main','https://github.com/rayudusubrahmanyam/java-maven-jenkins.git')
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


