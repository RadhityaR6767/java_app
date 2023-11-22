pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh '''
          a=$(sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml)
          echo $a | cut -d ' ' -f1 > aaa.txt
        '''
      }
    }
    stage('Build') {
      steps {
        cat aaa.txt
      }
    }
    stage('Deploy') {
      steps {
        echo "Deploy"
      }
    }
  }
}
