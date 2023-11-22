pipeline {
  agent any
  environment {
    a = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true)
    b = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true)
    c = sh(script: "cat pom.xml", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          echo $a
          echo $c
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
