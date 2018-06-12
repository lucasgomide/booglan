require './booglan/characteristic.rb'
require './addons_string.rb'

module Booglan
  class PrettyNumber
    include Characteristic
    include AddonsString

    # Avoiding magic numbers.
    MINIMUM_PRETTY_NUMBER_VALUE = 422224

    # This method receives text as argument to analisy and returns how
    # many pretty Booglan words exist. At first, we have to split
    # the text in words, then converting all of them to number in base 10.
    # The last step is selecting only the pretty numbers
    def perform(text)
      # Returning no pretty numbers in text if text is nil
      return message(0) unless text

      qnt_pretty_number = text.split.map { |word| to_base_10(word) } # converting word (base 20) to base 10
                          .keep_if { |number| pretty_number?(number) } # keeping only pretty numbers from all of converted numbers
                          .count # counting how many pretty number there are

      message(qnt_pretty_number)
    end

    private

    # This method converts Booglan numbers in base 20 to numbers in base 10.
    # As we already know, them digits are ordered from the least significant to # the most significant, so first of all it's necessary reverse the word though.
    # Well, in Booglan, words also represent numbers given in base 20, so to get
    # the number in base 10. To do it we must do something like that "X1 * 20 ^ X position in word) + (X2 * 20 ^ X position in word)."
    # At last I've used map/reduce to calc each group then adding them.

    # Pratical example "zdd". Z means 3 and D means 5
    # (5 * 20 ^ 2) + (5 * 20 ^ 1) + (3 * 20 ^ 0) = 2013
    def to_base_10(word)
      word.reverse.chars.map.with_index do |letter, index|
        # Avoiding crash when the letter requested doesn't exist in Booglan
        # alphabetic
        alphabetic_index = ALPHABETIC.find_index(letter) || 0

        alphabetic_index * 20 ** (word.size - (index + 1))
      end.reduce("+")
    end

    # This method validates if the number passed as argument satisfies all requirements to be considered a Booglans pretty number.
    def pretty_number?(number)
      number >= MINIMUM_PRETTY_NUMBER_VALUE && number % 3 == 0
    end

    def message(qnt)
      "This text has #{qnt.zero? ? 'no' : qnt} pretty #{pluralize('number', qnt)}"
    end
  end
end
