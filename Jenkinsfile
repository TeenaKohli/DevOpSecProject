pipeline {
  agent any
  tools {
      terraform "terraform-11"
  }
  
   environment {
	 EMAIL_TO = 'teena.kohli.8622@gmail.com'
	//TODO # 1 --> once you sign up for Docker hub, use that user_id here
        registry = "teenakohli2286/petkeepers.jar"
        //TODO #2 - update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'DockerHub'
        dockerImage = ''
	aws_access_key_id='ASIA3JXYMGHCPM7YTA73'
	aws_secret_access_key='fzSi8pmIT8HD1B7G3TbfswuCNRyETMftXUiceaxY'
	aws_session_token='FwoGZXIvYXdzEF0aDEqEUhnAkkmLxaAt4CLLAbK5UwW7wq74r8ENWWVboWqbhvTNJWhPG+kBbtXAWPij9x3gWyuyHXE7Rr9wOXfbz+wpgPTwudhgru9gdIMIFNbAB1ALo8jEdt+pd4lOl9KXXRppKc93+JSG2o1jcJqvQ+Cb4Ns/mKerb3pPKTxrrH0NzuGaztC3pVPKrAFbVENpDV4m8YbuHPSM0x1icK8OGnhxCc4BzeYK/dQIru7i8edJJNNlchuhSMllRVWyAY7qH/8x0zXsM4Dvrmu/MMMAY5rfJPdnNzqlCn8XKKuo2Y0GMi13LP+uAcSDHBNNhWNSEvE2Bh8pPYGNGnSPr8CwLEvcJ5z6xB36NEQ/oPbM2zQ='
   }
    
  stages {
    stage('Git Checkout') {
      steps {
        git branch: 'main', credentialsId: 'aba77e95-f0de-4a98-bb5c-578b80fed4fa', url: 'https://github.com/TeenaKohli/DevOpSecProject.git'
      }
    }
	
	stage('SonarScan') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') 
		{ 
          bat "mvn clean verify sonar:sonar -Dsonar.projectKey=Petkeepers"
        }
	}
	}
	  
     //Jar creation
     stage('JarCreation') {
	   steps {
        bat 'mvn clean package'
      }
	}
	  
    stage('Docker Build & Push') {
      steps{
        script {
          dockerImage = docker.build registry
	    docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }
    
    stage('Terraform init & apply') {
      steps {
	bat 'terraform init'
        bat 'terraform apply --auto-approve'
      }
    }
  }	 
     post {
    // Always runs. And it runs before any of the other post conditions.
       
 success {
      emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
       to: "${EMAIL_TO}", 
        subject: 'Congratulation on successful Build: $PROJECT_NAME - #$BUILD_NUMBER'
 }

    failure {
       emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
       to: "${EMAIL_TO}", 
        subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
    }
	     
 always {
      // Let's wipe out the workspace before we finish!
      deleteDir()
    }
  }	     
 
  
  // The options directive is for configuration that applies to the whole job.
  options {
    // For example, we'd like to make sure we only keep 10 builds at a time, so
    // we don't fill up our storage!
    buildDiscarder(logRotator(numToKeepStr:'5'))
    
    // And we'd really like to be sure that this build doesn't hang forever, so
    // let's time it out after an hour.
    timeout(time: 60, unit: 'MINUTES')
  }
}
