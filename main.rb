require './booglan_language.rb'

input = ARGV
booglan = BooglanLanguage.new
puts booglan.perform(input[0], input[1])