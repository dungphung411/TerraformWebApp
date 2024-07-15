pipeline {
    agent any

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
        stage("Choose Action") {
            steps {
                script {
                    def userInput = input(
                        message: 'Choose an action:',
                        parameters: [
                            choice(name: 'ACTION', choices: 'apply \n destroy', description: 'Select apply or destroy')
                        ]
                    )
                    if (userInput  == 'apply') {
                        echo "Applying Terraform changes"
                        bat ('terraform apply --auto-approve')
                    } else if (userInput  == 'destroy') {
                        echo "Destroying Terraform resources"
                        bat ('terraform destroy --auto-approve')
                    }
                }
            }
        }
    }
}
