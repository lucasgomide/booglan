require './booglan/characteristic.rb'
require './addons_string.rb'

module Booglan
  class Verb
    include Characteristic
    include AddonsString

    MINIMUM_VERB_SIZE = 8

    def perform(text)
      return message(0, 0) unless text
      qnt_verb, qnt_inflected_verb = calculate_qnt_verb(text)

      message(qnt_verb, qnt_inflected_verb)
    end

    private

    # This method calculate how many verb and inflected verb exist.
    def calculate_qnt_verb(text)
      qnt_verb = 0
      qnt_inflected_verb = 0

      text.split.each do |word| # splitting text up into some words
        if verb?(word)
          qnt_verb += 1 # increasing qnt verb counter
          qnt_inflected_verb += 1 unless FOO_LETTERS.include?(word[0]) # if the verb starts with a BAR LETTER, the inflected verb counter will be increased
        end
      end
      [qnt_verb, qnt_inflected_verb]
    end

    # This method validates if the word passed as argument satisfies all requirements to be considered the verb.
    def verb?(word)
      word.size >= MINIMUM_VERB_SIZE && # at least 8 chars
        !FOO_LETTERS.include?(word[word.size - 1]) # the last letter must be included in BAR LETTER group
    end

    def message(qnt_verb, qnt_inflected_verb)
      "This text has #{qnt_verb} #{pluralize('verb', qnt_verb)} and #{qnt_inflected_verb} inflected #{pluralize('verb', qnt_inflected_verb)}"
    end
  end
end
