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
		
		stage ('CLEAN_OLD_M2') {
			
			steps {
				sh "rm -rf /home/saccount/.m2/repository"
				
			}
			
		}
	
		stage ('MAVEN_BUILD') {
		
			steps {
						
						sh "mvn clean package"
			
			}
			
		
		}
		
		stage ('COPY_WAR_TO_Server'){
		
				steps {
						
						sh "scp -r target/LoginWebApp.war saccount@10.0.2.51:/data/project/wars"

						}
				
				}
	
	
	
	}
		
}
