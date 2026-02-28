pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build on Remote Docker Server') {
            steps {
                sh '''
                ssh munna@192.168.0.113 "rm -rf /home/munna/tomcat-build"
                scp -r * munna@192.168.0.113:/home/munna/tomcat-build
                ssh munna@192.168.0.113 "
                    cd /home/munna/tomcat-build &&
                    docker build -t tomcat-app . &&
                    docker stop tomcat-container || true &&
                    docker rm tomcat-container || true &&
                    docker run -d -p 9090:8080 --name tomcat-container tomcat-app
                "
                '''
            }
        }
    }
}
