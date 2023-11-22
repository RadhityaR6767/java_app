def extractArtifactAndVersion() {
    try {
        def artifactId = sh(script: "sed -n 's|<artifactId>\\(.*\\)</artifactId>|\\1|p' pom.xml", returnStdout: true).trim()
        def version = sh(script: "sed -n 's|<version>\\(.*\\)</version>|\\1|p' pom.xml", returnStdout: true).trim()

        artifactId = artifactId.split(' ')[0]
        version = version.split(' ')[0]

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
        echo 'A: ${ARTIFACT_ID}, B:${VERSION}'
        sh './mvnw clean package'
        sh "java -jar target/${ARTIFACT_ID}-${VERSION}.jar"
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
