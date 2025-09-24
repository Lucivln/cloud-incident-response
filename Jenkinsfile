pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'eu-north-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Lucivln/cloud-incident-response.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    withCredentials([usernamePassword(credentialsId: 'b6fdd17c-4999-4544-a284-dae3127db2d7',
                                                     usernameVariable: 'AWS_ACCESS_KEY_ID',
                                                     passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    withCredentials([usernamePassword(credentialsId: 'b6fdd17c-4999-4544-a284-dae3127db2d7',
                                                     usernameVariable: 'AWS_ACCESS_KEY_ID',
                                                     passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    withCredentials([usernamePassword(credentialsId: 'b6fdd17c-4999-4544-a284-dae3127db2d7',
                                                     usernameVariable: 'AWS_ACCESS_KEY_ID',
                                                     passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        failure {
            echo 'Pipeline failed ❌'
        }
        success {
            echo 'Pipeline succeeded ✅'
        }
    }
}
