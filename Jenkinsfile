pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          post {
            always {
              archiveArtifacts(artifacts: '**/*.jar', fingerprint: true)

            }

          }
          steps {
            withMaven(maven: 'Maven') {
              sh 'mvn -B -DskipTests clean package'
            }

          }
        }
        stage('') {
          steps {
            echo 'step 2'
          }
        }
        stage('') {
          steps {
            echo 'step 3'
          }
        }
      }
    }
    stage('Test') {
      post {
        always {
          junit 'target/surefire-reports/*.xml'

        }

      }
      steps {
        withMaven(maven: 'Maven') {
          sh '/usr/local/apache-maven/apache-maven-3.5.4/bin/mvn test'
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