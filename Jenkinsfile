pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                     git branch: 'main', changelog: false, poll: false, url: 'https://github.com/dungphung411/Terraform-Blog.git'
          }
        }
        
    #thisforcreate-delete-it-to-run 
        stage ("terraform init") {
            steps {
                bat ('terraform init') 
            }
        }
        
        stage ("terraform Action") {
            steps {
                echo "Terraform plan and apply"
                bat ('terraform apply --auto-approve') 
           }
        }
    #thisisfordestroy-delete-the-2-block-below-to-destroy
        stage ("terraform destroy") {
            steps {
                echo "terraform destroy"
                bat ('terraform destroy --auto-approve')
            }
        }
    }   
}   