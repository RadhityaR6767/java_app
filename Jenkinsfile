pipeline {
  agent any
  environment {
    a = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml | cut -d ' ' -f1", returnStdout: true)
    b = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml | cut -d ' ' -f1", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          ./mvnw clean package
          java -jar target/env.a-env.b.jar
        '''
      }
    }
    stage('Docker Build') {
      steps {
        sh 'echo "build"'
      }
    }
    stage('Deploy') {
      steps {
        echo "deploy"
      }
    }
  }
}
