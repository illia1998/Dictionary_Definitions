pipeline {
    agent any

    environment {
        PATH = "/usr/local/rvm/rubies/ruby-3.1.2/bin:${PATH}"
    }
    
    parameters {
        string(defaultValue: "features/", description: "Features to be run", name: "Features")
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
                cucumber features/${params.Features}
                """
            }
        }
    }
}


