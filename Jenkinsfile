pipeline {
    agent any

    environment {
        PATH = "/usr/local/rvm/rubies/ruby-3.1.2/bin:${PATH}"
    }
    
    parameters {
        string(defaultValue: "features/", description: "Insert features to be run", name: "FEATURES")
        booleanParam(defaultValue: false, description: 'Send email notification?', name: 'SEND_EMAIL')
        string(defaultValue: '', description: 'Email address to notify', name: 'EMAIL',  when: { params.SEND_EMAIL })
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
                cucumber ${params.FEATURES}
                """
            }
        }
    }
    post {
        always {
            script {
                if (params.SEND_EMAIL) {
                    mail to: params.EMAIL,
                         subject: "Pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} ${currentBuild.result}",
                         body: "Your Jenkins pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} has completed with ${currentBuild.result} result."
                 }
            }
        }
    }
}

