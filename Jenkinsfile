pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')     // Jenkins credential ID for Access Key
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Jenkins credential ID for Secret Key
        AWS_DEFAULT_REGION    = 'eu-north-1'
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
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
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
