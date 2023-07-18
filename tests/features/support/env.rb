require_relative '../../../bin/dictionary_definitions_parse'
require_relative '../../../bin/dictionary_definitions_api'
require_relative 'constants'
require 'active_support/testing/stream'
require_relative 'helper_methods'
require 'allure-cucumber'

AllureCucumber.configure do |config|
  config.results_directory = 'results/allure-results'
  config.clean_results_directory = true # set 'false' to see runs trend
end

at_exit do
  system('allure generate results/allure-results --clean')
end

World(ActiveSupport::Testing::Stream, HelperMethods)


