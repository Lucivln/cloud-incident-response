pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Lucivln/cloud-incident-response.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh '''
                cd terraform
                terraform init
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                cd terraform
                terraform plan
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                input message: 'Apply infrastructure changes?', ok: 'Yes, apply'
                sh '''
                cd terraform
                terraform apply -auto-approve
                '''
            }
        }
    }
}
