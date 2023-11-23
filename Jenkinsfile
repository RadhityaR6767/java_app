def extractArtifactAndVersion() {
    try {
        def artifactId = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true).trim()
        def version = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true).trim()

        artifactId = artifactId.split(' ')[1] //[0].replaceAll("\\s","")
        version = version.split(' ') //[0].replaceAll("\\s","")

        return [artifactId, version]
    } catch (Exception e) {
        error "Failed to extract artifactId and version from pom.xml: ${e.message}"
    }
}

pipeline {
  agent any
  environment {
    def values = extractArtifactAndVersion()
    ARTIFACT_ID = "${values[0]}"
    VERSION = "${values[1]}"
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Test') {
      steps {
        sh '''
          ./mvnw clean package
          java -jar target/${ARTIFACT_ID}-${VERSION}.jar
        '''
      }
    }
    stage('Docker Build') {
      steps {
        sh 'sed -i "s|<<ARTIFACTID>>|${ARTIFACT_ID}|g; s|<<VERSION>>|${VERSION}|g" Dockerfile'
        sh 'cat Dockerfile'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh 'docker build -t ${ARTIFACT_ID}:${VERSION} .'
        sh 'docker tag ${ARTIFACT_ID}:${VERSION} $DOCKERHUB_CREDENTIALS_USR/${ARTIFACT_ID}:${VERSION}'
        sh 'docker push $DOCKERHUB_CREDENTIALS_USR/${ARTIFACT_ID}:${VERSION}'
        sh 'docker system prune -f'
      }
    }
    stage('Deploy K8s') {
      steps {
        sh 'sed -i "s|<<ARTIFACTID>>|${ARTIFACT_ID}|g; s|<<VERSION>>|${VERSION}|g; s|<<CRED_REG>>|$DOCKERHUB_CREDENTIALS_USR|g" k8s/deployment.yaml'
        sh 'cat k8s/deployment.yaml'
        sh 'kubectl apply -f k8s/'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
