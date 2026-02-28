pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t tomcat-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop tomcat-container || true'
                sh 'docker rm tomcat-container || true'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 9090:8080 --name tomcat-container tomcat-app'
            }
        }
    }
}
