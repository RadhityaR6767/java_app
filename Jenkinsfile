pipeline {
  agent any
  environment {
    a=$(sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml)
    b=$(sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml)
    a=$(echo $a | cut -d ' ' -f1)
    b=$(echo $b | cut -d ' ' -f1)
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          ./mvnw clean package
          java -jar target/${a}-${b}.jar
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
