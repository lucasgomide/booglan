require './booglan/characteristic.rb'
require './addons_string.rb'

module Booglan
  class Preposition
    include Characteristic
    include AddonsString

    PREPOSITION_SIZE = 5

    # This method receives text as argument to analisy and returns how
    # many preposition exist. At first, we have to split
    # the text in words, then selecting only the preposition words
    def perform(text)
      # Returning no preposition in text if text is nil
      return message(0) unless text

      qnt = text.split # splitting text up into some words
            .keep_if { |word| preposition?(word) } # keeping only prepositions from all words in the text
            .count # counting how many prepositions there are
      return message(qnt)
    end

    def message(qnt)
      "This text has #{qnt} #{pluralize('preposition', qnt)}"
    end

    private

    # This method validates if the word passed as argument satisfies all requirements to be considered the preposition.
    def preposition?(word)
      word.size == PREPOSITION_SIZE && # exactly 5 chars
        !FOO_LETTERS.include?(word[4]) && # The last letter should be included in BAR LETTER group
        !word.include?("l") # The word can't include the letter "l"
    end
  end
end
