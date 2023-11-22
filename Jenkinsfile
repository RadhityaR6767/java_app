pipeline {
  agent any
  environment {
    a = $/eval "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml | cut -d ' ' -f1" /$
    aa = sh(script: "$a", returnStdout: true)
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo $aa'
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
