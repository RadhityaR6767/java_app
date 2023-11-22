pipeline {
  agent any
  environment {
    a = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true)
    b = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true)
    aa = a.split(' ')[0]
    bb = b.split(' ')[0]
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo $bb'
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
