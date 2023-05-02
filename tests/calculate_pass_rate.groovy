def calculatePassRate() {
    def failedScenarios = 0
    def totalScenarios = 0
    sh 'cd tests && grep -Eo ":[0-9]+" results/final_failures.txt | wc -l > rerun-failures-count'
    failedScenarios = readFile 'tests/rerun-failures-count'.trim()
    totalScenarios = sh(returnStdout: true, script: "cd tests && ruby count_scenarios.rb ${params.FEATURES}")
    def passRate = (failedScenarios.toFloat() / totalScenarios.toFloat()) * 100
}


