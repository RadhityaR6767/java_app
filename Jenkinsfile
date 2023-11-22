pipeline {
  agent any
  environment {
    a = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true)
    b = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true)
    artifactid = sh(script: "echo $a | cut -d ' ' -f1", returnStdout: true)
    version = sh(script: "echo $b | cut -d ' ' -f1", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo $version'
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
