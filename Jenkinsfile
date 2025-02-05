pipeline {
  agent any

  stages {
    stage ('clean-workspace') {
      steps {
        cleanWs()
      }
    }

    stage ('source-checkout') {
      steps {
        checkout scm
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
