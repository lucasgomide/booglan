require 'simplecov'
SimpleCov.start

if ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

Dir[
  File.join(__dir__, '*_test.rb'), File.join(__dir__, '*', '*_test.rb')
].each { |file| require file }