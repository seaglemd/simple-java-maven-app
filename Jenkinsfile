pipeline {
    agent any
    stages {
        stage('Maven Test') {
            steps {
                withMaven(
                    // Maven installation declared in the Jenkins "Global Tool Configuration"
                    maven: 'M3'
                    // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
                    // Maven settings and global settings can also be defined in Jenkins Global Tools Configuration
                    //mavenSettingsConfig: 'my-maven-settings',
                    //mavenLocalRepo: '.repository') {

                        // Run the maven build
                        sh 'echo $PATH'
                        sh 'whoami' 
                        sh 'mvn -v'     

                    } // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe & FindBugs reports...                         
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
