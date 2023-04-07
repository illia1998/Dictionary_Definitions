pipeline {
    agent any

    environment {
        PATH = "/usr/local/rvm/rubies/ruby-3.1.2/bin:${PATH}"
    }

    stages {
        stage('Ruby Version') {
            steps {
                sh 'ruby --version'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'sudo rm /usr/bin/mkdir'
                sh 'sudo ln -s /bin/mkdir /usr/bin/mkdir'
                sh 'sudo env PATH="$PATH" bundle install'
            }
        }
        
        stage('Find definition') {
            steps {
                sh 'ruby bin/find_term_html.rb'
            }
        }
    }
}


