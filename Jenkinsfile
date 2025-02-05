pipeline {
  agent any

  stages {
    stage ('clean-workspace') {
      steps {
        cleanWs()
      }
    }

    stage ('checking-the-current-workspace') {
      steps {
        sh 'pwd'
        sh 'ls -l'
      }
    }

    stage ('terraform-init') {
      steps {
        sh '/opt/homebrew/bin/terraform init'
      }
    }

    stage ('terraform-apply') {
      steps {
        sh '/opt/homebrew/bin/terraform apply --auto-approve'
      }
    }
  }
}
