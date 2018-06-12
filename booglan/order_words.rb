require './booglan/characteristic.rb'

module Booglan
  class OrderWords
    include Characteristic

    # This method will order words by Booglan alphabetic.
    def perform(text)
      return "" unless text
      find_coordination_by_words(text) # Find all words' coordinates in whole text.
        .map { |coordinate| find_word_by_coordinate(coordinate) } # After find words' coordinates we have to find the entire word by coordinate given
        .join(" ") # Turn array into string and separeted all of items using space(" ")
    end

    private

    # This method receive text as argument and returns words' coordinates.
    def find_coordination_by_words(text)
      list = []
      text.split.each_with_index do |word, index| # splitting text up into words
        # The next two lines will store in Array list the position of each
        # word's letter.
        # The result will be something like that:
        # List -> [[0, 2], [1, 0], [0, 0 , 1], [1, 0]]
        list << word.each_char.map do |letter|
          ALPHABETIC.find_index(letter)
        end
      end

      # The next line will remove any nil value, sort and remove duplicates
      # The result will be something like that:
      # List -> [[0, 0 , 1], [0, 2], [1, 0]]
      list.compact.sort.uniq
    end

    # This method receives some letters coordinate at Booglan alphabetic.
    # With them it's easy find the letter then build any word.
    def find_word_by_coordinate(coordinate)
      coordinate.map { |i| ALPHABETIC[i] }.join
    end
  end
end
