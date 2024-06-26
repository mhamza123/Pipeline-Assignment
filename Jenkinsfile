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
      steps {
        script {
          def scannerHome = tool name: 'sonar-scanner'
          withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner"
          }
        }
      }
    }

    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build imagename
        }
      }
    }

    stage('Run Image') {
      steps {
        script {
          // Ensure the script is executable and run it
          sh '''
            cd $WORKSPACE/Pipeline-Testing  # Adjust the path to match where flask.sh is located
            chmod +x flask.sh
            ./flask.sh
          '''
        }
      }
    }
  }
}
