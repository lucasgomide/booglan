require './booglan/characteristic.rb'

module Booglan
  class OrderWords
    include Characteristic

    def perform(text)
      ordered_list = order_words(text)
      return ordered_list.map do |word|
        word.map { |i| ALPHABETIC[i] }.join
      end.join(' ')
    end

    private

    def order_words(text)
      list = []
      return list unless text
      text.split.each_with_index do |word, index|
        word.each_char do |letter|
          if list[index]
            list[index] << ALPHABETIC.find_index(letter)
          else
            list[index] = [ALPHABETIC.find_index(letter)]
          end
        end
      end
      list.compact.sort.uniq
    end
  end
end