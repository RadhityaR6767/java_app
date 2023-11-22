pipeline {
  agent any
  environment {
    a = sh(script: "/bin/bash -c 'sed -n \'s|<artifactId>\\(.*\\)</artifactId>|\\1|p\' pom.xml'", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo $a'
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
