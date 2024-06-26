pipeline {

  environment {
    imagename = "flaskapp"
    dockerImage = ''
  }

  agent any

  stages {

    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/mhamza123/Pipeline-Testing.git', branch: 'master', credentialsId: 'd5faf3eb-8afc-42df-b934-2a3d3c030656'])
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
    stage('Run Image') {
      steps{
        script {
          dockerImage.run('-d -p 3000:3000')
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
