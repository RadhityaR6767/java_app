pipeline {
  agent any
  environment {
    a = sh(script: "/bin/bash -c 'sed -n \'s|<artifactId>\\(.*\\)</artifactId>|\\1|p\' pom.xml | cut -d \' \' -f1'", returnStdout: true)
    b = sh(script: "/bin/bash -c 'sed -n \'s|<version>\\(.*\\)</version>|\\1|p\' pom.xml | cut -d \' \' -f1'", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo $b'
        // ./mvnw clean package
        // java -jar target/$artifactid-$version.jar
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
