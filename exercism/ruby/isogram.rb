module Isogram
  def self.isogram?(input)
    chars = input.downcase.chars - [' ', '-']
    chars.uniq == chars
  end
end
