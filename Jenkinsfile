pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh "./script.sh"
      }
    }
    stage('Build') {
      steps {
        echo "Build"
      }
    }
    stage('Deploy') {
      steps {
        echo "Deploy"
      }
    }
  }
}
