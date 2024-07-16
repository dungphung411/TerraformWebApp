pipeline {
    agent any
    parameters {
        choice(name: 'ACTION', choices: 'apply\ndestroy', description: 'Select apply or destroy')
    }


    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/dungphung411/TerraformWebApp.git'
            }
        }
        stage("Terraform Init") {
            steps {
                bat ('terraform init') 
            }
        }
        stage("Terraform Plan") {
            steps {
                bat ('terraform plan -no-color > tfplan.txt')
                bat ('type tfplan.txt')
            }
        }
        stage('Build') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        echo "Applying Terraform changes"
                        bat ('terraform apply --auto-approve')
                    } else if (params.ACTION == 'destroy') {
                        echo "Destroying Terraform resources"
                        bat ('terraform destroy --auto-approve')
                    }
                }
            }
        }
    }
}

