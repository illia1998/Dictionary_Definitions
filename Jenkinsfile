pipeline {
    agent any
    
      options {
        ansiColor('xterm')
    }

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
                dir('tests') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                      sh """
                      echo '\033[1;32mRunning Cucumber...\033[36;1m'
                      cucumber -p jenkins ${params.FEATURES}
                      """
                    }
                echo '\033[1;32mFirst Cucumber Run Completed.\033[0m'
                }       
            }
        }
        
         stage('Rerun Failed Scenarios') {
            steps {
                dir('tests') {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                      sh """
                      echo '\033[1;32mRe-Running Failing Features...\033[36;1m'
                      cucumber @results/rerun.txt --publish-quiet -f pretty -f rerun -o results/final_failures.txt
                      """
                    }
                echo '\033[1;32mRe-Run Completed.\033[0m'
                } 
            }
        }
        
        stage('Save artifacts') {
            steps {
                archiveArtifacts artifacts: 'tests/results/final_failures.txt, tests/results/rerun.txt'
            }
        }
        
        stage('Allure Report') {
            steps {
                allure([
                    includeProperties: false,
                    jdk: '',
                    properties: [],
                    reportBuildPolicy: 'ALWAYS',
                    results: [[path: 'tests/results/allure-results']]
                ])
            }
        }
    }

    post {
        always {
            script {
                if (params.EMAIL) {
                    def passRateInfo =  load ('./calculate_pass_rate.groovy')
                    mail to: params.EMAIL,
                         subject: "Pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} ${currentBuild.result}",
                         body: "Your Jenkins pipeline '${env.JOB_NAME}' Build #${env.BUILD_ID} has completed as ${currentBuild.result}.\n\nTotal scenarios pass rate: ${passRateInfo.failedScenarios}/${passRateInfo.totalScenarios} (${passRateInfo.passRate}%) passed"
                 }
            }
        }
    }
}
