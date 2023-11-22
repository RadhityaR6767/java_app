pipeline {
  agent any
  environment {
    a = $/eval "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml | cut -d ' ' -f1" /$
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
