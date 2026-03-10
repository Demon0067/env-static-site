pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'f1bfbd85-84ce-404c-b069-1c91d0206b8b'
                ]]) {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'f1bfbd85-84ce-404c-b069-1c91d0206b8b'
                ]]) {
                    bat 'terraform plan'
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input message: 'Approve Terraform Apply?'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'f1bfbd85-84ce-404c-b069-1c91d0206b8b'
                ]]) {
                    bat 'terraform apply -auto-approve'
                }
            }
        }

        stage('Upload Website') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'f1bfbd85-84ce-404c-b069-1c91d0206b8b'
                ]]) {

                    bat '''
                    aws s3 sync site/ s3://harit-static-site-demo-2026 --delete
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Static website deployed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}