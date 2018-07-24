pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                withMaven(maven: 'Maven') {
                        sh 'mvn -B -DskipTests clean package'
                    }
            }
            post {
                always {
                    archiveArtifacts artifacts: '**/*.jar', fingerprint: true
                }
            }
        }
        stage('Test') {
            steps {
                withMaven(maven: 'Maven') {
                        sh '/usr/local/apache-maven/apache-maven-3.5.4/bin/mvn test'
                    }
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                withMaven(maven: 'Maven') {
                        sh './jenkins/scripts/deliver.sh'
                }
            }
        }
    }
}
