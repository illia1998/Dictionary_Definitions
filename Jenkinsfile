pipeline {
    agent any

    environment {
        PATH = "/usr/local/rvm/rubies/ruby-3.1.2/bin:${PATH}"
    }
    
    parameters {
        string(defaultValue: "features/", description: "Insert features to be run", name: "Features")
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
            mail to: 'illiaferents@gmail.com',
                 subject: "Pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} ${currentBuild.result}",
                 body: "Your Jenkins pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} has completed with ${currentBuild.result} result."
        }
    }
}


