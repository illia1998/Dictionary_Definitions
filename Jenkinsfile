pipeline {
    agent any

    environment {
        PATH = "/usr/local/rvm/rubies/ruby-3.1.2/bin:${PATH}"
    }

    parameters {
        string(defaultValue: "features/", description: "Insert features to be run", name: "FEATURES")
        string(defaultValue: '', description: 'Email address to notify', name: 'EMAIL')
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'sudo rm /usr/bin/mkdir'
                sh 'sudo ln -s /bin/mkdir /usr/bin/mkdir'
                sh 'sudo env PATH="$PATH" bundle install'
            }
        }

        stage('Run Cucumber') {
            steps {
                catchError(buildResult: 'SUCCESS', propagate: false) {
                    sh """
                    cd tests
                    cucumber -p jenkins ${params.FEATURES}
                    """
                }
            }
        }
        
        stage('Rerun Failed Scenarios') {
            when {
                expression { currentBuild.result == 'FAILURE' }
            }
            steps {
                sh """
                cd tests
                cucumber @rerun.txt --format rerun --out final-failures.txt
                """
            }
            post {
                always {
                    archiveArtifacts artifacts: 'final-failures.txt'
                }
            }
        } 
    }

    post {
        always {
            script {
                if (params.EMAIL) {
                    mail to: params.EMAIL,
                         subject: "Pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} ${currentBuild.result}",
                         body: "Your Jenkins pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} has completed with ${currentBuild.result} result."
                 }
            }
        }
    }
}
