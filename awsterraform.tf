pipeline {
    agent any
    environment {
        TFVARS = 'awsterraform.tfvars'   // change only here if you rename file
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/vaseem-06/Terraform.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                 sh 'terraform plan -var-file=environment.tfvars'
    }
}
        stage('Terraform Apply') {
            steps {
                script {
                    if (fileExists(env.TFVARS)) {
                        sh "terraform apply -auto-approve -var-file=${env.TFVARS}"
                    } else {
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
    }
}
