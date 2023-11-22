pipeline {
  agent any
  environment {
    a = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true)
    b = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true)
    a = sh(script: "echo $a | cut -d ' ' -f1", returnStdout: true)
    b = sh(script: "echo $b | cut -d ' ' -f1", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          ./mvnw clean package
          java -jar target/$a-$b.jar
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
