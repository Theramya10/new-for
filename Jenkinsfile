pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Theramya10/new-for.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Proceed with Terraform Apply?", ok: "Apply"
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { return params.DESTROY_ENVIRONMENT == true }
            }
            steps {
                input message: "Proceed with Terraform Destroy?", ok: "Destroy"
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    parameters {
        booleanParam(name: 'DESTROY_ENVIRONMENT', defaultValue: false, description: 'Check this to destroy infrastructure')
    }

    post {
        success {
            echo "Terraform pipeline executed successfully."
        }
        failure {
            echo "Pipeline failed. Check logs for details."
        }
    }
}