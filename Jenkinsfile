pipeline {
    agent any

    environment {
        PATH = "/usr/local/rvm/rubies/ruby-3.1.2/bin:${PATH}"
    }
    
    parameters {
        string(defaultValue: "features/", description: "Insert features to be run", name: "Features")
        booleanParam(defaultValue: false, description: 'Send email notification?', name: 'sendEmail')
        string(defaultValue: '', description: 'Email address to notify', name: 'Email')
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
                sh """
                cd tests
                cucumber ${params.Features}
                """
            }
        }
    }
    post {
        always {
            script {
                if (params.sendEmail) {
                    mail to: params.Email,
                         subject: "Pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} ${currentBuild.result}",
                         body: "Your Jenkins pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} has completed with ${currentBuild.result} result."
                 }
            }
        }
    }
}

