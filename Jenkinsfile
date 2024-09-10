pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('s7valdes-dockerhub')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'MINUTES')
        timestamps()
    }
    stages {




 


        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('build-image') {
            steps {
                sh '''
                cd ${WORKSPACE}
               
                docker build -t versage/creative:v1 -f hallo.Dockerfile .
                '''
            }
        }

        stage('Push image') {
    
           steps {
               sh '''
               docker push versage/creative:v1
               '''
           }
        }

        






    }

    post {
        success {
            slackSend(channel: '#development-alerts', color: 'good', message: "SUCCESSFUL: Application valdes-do-it-yourself-UI  Job '${env.JOB_NAME} [${env.TAG}]' (${env.BUILD_URL})")
        }

        unstable {
            slackSend(channel: '#development-alerts', color: 'warning', message: "UNSTABLE: Application valdes-do-it-yourself-UI  Job '${env.JOB_NAME} [${env.TAG}]' (${env.BUILD_URL})")
        }

        failure {
            slackSend(channel: '#development-alerts', color: '#FF0000', message: "FAILURE: Application valdes-do-it-yourself-UI Job '${env.JOB_NAME} [${env.TAG}]' (${env.BUILD_URL})")
        }

        cleanup {
            deleteDir()
        }
    }
}