pipeline {
    agent any
    stages {
        stage('Maven Test') {
            steps {
                sh 'echo $PATH'                
            }
            steps {
                sh 'whoami'
            }
        }
        stage('Build') {
            steps {
                sh '/usr/local/apache-maven/apache-maven-3.5.4/bin/mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh '/usr/local/apache-maven/apache-maven-3.5.4/bin/mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
