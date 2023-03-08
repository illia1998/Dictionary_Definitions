require_relative '../../../bin/find_term_html'
require 'active_support/testing/stream'
require_relative 'helper_methods'
require 'allure-cucumber'

AllureCucumber.configure do |config|
  config.results_directory = 'report/allure-results'
  config.clean_results_directory = true
end

at_exit do
  system('allure generate report/allure-results --clean')
end

World(ActiveSupport::Testing::Stream, HelperMethods)


