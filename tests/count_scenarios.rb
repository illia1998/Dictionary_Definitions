def count_scenarios(features)
  cmd = "cucumber --dry-run -f pretty --publish-quiet #{features}"
  stdout = `#{cmd}`
  raise "Command failed: #{cmd}" unless $?.success?

  puts stdout.match(/(\d+)\sscenarios/)[1].to_i
end

count_scenarios(ARGV[0])
