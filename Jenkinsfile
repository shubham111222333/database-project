pipeline {
agent {
label {
		label "built-in"
		customWorkspace "/data/project-myapp"
		
		}
		}
		
	stages {
		stage('SCM') {
            steps {
                checkout scm
            }
        }

		stage('SonarQubeScan') {
            steps {
		    withSonarQubeEnv( 'sonarqube' ) {
                    sh "/home/ec2-user/apache-maven-3.8.6/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=database -Dsonar.projectName='database'"
                    }    
	}
        }
		 stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn clean package"
            }
        }
        
        stage('Deploy') {
            steps {
                sh "cp target/LoginWebApp.war /home/ec2-user/apache-tomcat-9.0.75/webapps"
            }
        }
	
	
	
	}
		
}
