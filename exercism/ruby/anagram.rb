# Mine
class Anagram
  attr_reader :anagram

  def initialize(anagram)
    @anagram = anagram.downcase.chars
  end

  def match(words)
    words.select do |word|
      candidate_word = word.downcase.chars
      next if candidate_word.size != anagram.size || candidate_word == anagram

      anagram.each do |char|
        if index = candidate_word.find_index(char)
          candidate_word.delete_at(index)
        end
      end
  
      candidate_word.size == 0
    end
  end
end

# Community solution
class Anagram
  attr_reader :word_to_match

  def initialize(word_to_match)
    @word_to_match = word_to_match.downcase
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    word_to_match.chars.sort == word.chars.sort unless identical?(word)
  end

  def identical?(word)
    word == word_to_match
  end
end
