pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh '''
          ./mvnw clean package
          a=$(sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml)
          b=$(sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml)
          a=$(echo $a | cut -d ' ' -f1)
          b=$(echo $b | cut -d ' ' -f1)
          java -jar target/$a-$b.jar
        '''
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker images'
        sh './script.sh'
      }
    }
    stage('Deploy') {
      steps {
        echo "deploy"
      }
    }
  }
}
