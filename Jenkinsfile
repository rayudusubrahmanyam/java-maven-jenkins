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
                    sh 'mvn clean package'
                }
            }
        }
        stage('Docker Image Build') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }   
    }
}
