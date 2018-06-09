require './booglan/characteristic.rb'
require './addons_string.rb'

module Booglan
  class Preposition
    include Characteristic
    include AddonsString

    def perform(text)
      return message(0) unless text

      qnt = text.split.keep_if { |word| preposition?(word) }.size
      return message(qnt)
    end

    def message(qnt)
      "This text has #{qnt} #{pluralize('preposition', qnt)}"
    end

    private
    def preposition?(word)
      word.size == 5 && !FOO_LETTERS.include?(word[4]) && !word.include?("l")
    end
  end
end