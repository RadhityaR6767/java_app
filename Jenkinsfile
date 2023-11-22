def extractArtifactAndVersion() {
    try {
        def artifactId = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true).trim()
        def version = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true).trim()

        artifactId = artifactId.split(' ')[0].replaceAll("\\s","")
        version = version.split(' ')[0].replaceAll("\\s","")

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
      }
    }
    stage('Deploy') {
      steps {
        echo "deploy"
      }
    }
  }
}
