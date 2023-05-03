require 'logger'

Before do
  @logger = Logger.new($stdout)
  @logger.formatter = proc do |severity, datetime, _progname, msg|
    "[#{severity}] #{msg}\n"
  end
end

Before do
  path = File.join(Dir.pwd, 'results')
  Dir.mkdir(path) unless Dir.exist?(path)
end
