Dir[
  File.join(__dir__, '*_test.rb'), File.join(__dir__, '*', '*_test.rb')
].each { |file| require file }

