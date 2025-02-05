pipeline {
  agent any

  stages {
    stage ('clean-workspace') {
      steps {
        cleanWs()
      }
    }

    stage ('terraform-init') {
      steps {
        sh 'terraform init'
      }
    }

    stage ('terraform-apply') {
      steps {
        sh 'terraform apply --auto-approve'
      }
    }
  }
}
