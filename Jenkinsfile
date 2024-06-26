pipeline {
  environment {
    imagename = "ihamza59/helloo"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        
      }
    }
    stage('SonarQube Analysis') {
    steps{
    script{
    def scannerHome = tool name: 'sonar-scanner';
    withSonarQubeEnv('sonarqube') {
      sh "${scannerHome}/bin/sonar-scanner"
      }
    }
  }
}
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
 
      }
    }
  }
}
