require './booglan/characteristic.rb'
require './addons_string.rb'

module Booglan
  class Verb
    include Characteristic
    include AddonsString

    def perform(text)
      qnt_verb, qnt_inflected_verb = calculate_qnt_verb(text)

      return "This text has #{qnt_verb} #{pluralize('verb', qnt_verb)} and #{qnt_inflected_verb} inflected #{pluralize('verb', qnt_inflected_verb)}"
    end

    private
    def calculate_qnt_verb(text)
      qnt_verb = 0
      qnt_inflected_verb = 0
      return [qnt_verb, qnt_inflected_verb] unless text

      text.split.each do |word|
        if verb?(word)
          qnt_verb += 1
          qnt_inflected_verb += 1 unless FOO_LETTERS.include?(word[0])
        end
      end
      [qnt_verb, qnt_inflected_verb]
    end

    def verb?(word)
      word.size >= 8 && !FOO_LETTERS.include?(word[word.size - 1])
    end
  end
end