pipeline {
  agent any
  environment {
    POM_VERSION = sh(script: "/bin/bash -c 'sed -n \'/<version>/,/<version/p\' pom.xml | head -1 | sed \'s/[[:blank:]]*<\\/*version>//g\'\''", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo $POM_VERSION'
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
