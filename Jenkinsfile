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
        stage('Java Build Test') {
            steps {
                script {
                    sh 'mvn test'
                }
            }
        }
        stage('Docker Image Build') {
            steps {
                script {
                   sh "docker build -t rayudusubrahmanyam/myapp:$BUILD_NUMBER.0 ."
                }
            }
        } 
        stage('Docker Image Push') {
            steps {
                script {
                    withCredentils([usernamePassword(credentialsId: 'DockerHub', PasswordVariable:'PASS', usernameVariable: 'USER')])
                                                     {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push rayudusubrahmanyam/myapp:$BUILD_NUMBER.0"   
                                                     }
                }
            }
        }        
    }
}
