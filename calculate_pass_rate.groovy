def calculatePassRate() {
    sh 'cd tests && grep -Eo ":[0-9]+" results/final_failures.txt | wc -l > rerun-failures-count'
    def failedScenarios = readFile 'tests/rerun-failures-count'.trim()
    def totalScenarios = sh(returnStdout: true, script: "cd tests && ruby count_scenarios.rb ${params.FEATURES}")
    def passedScenarios = (totalScenarios.toFloat() - failedScenarios.toFloat()).toInteger()
    def passRate = (passedScenarios / totalScenarios.toFloat()) * 100
    
    return [
        failedScenarios: failedScenarios.trim(),
        totalScenarios: totalScenarios.trim(),
        passedScenarios:  passedScenarios,
        passRate: passRate.round(2)
    ]
}

calculatePassRate()
