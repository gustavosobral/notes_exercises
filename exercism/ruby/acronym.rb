class Acronym
  def self.abbreviate(phrase)
    phrase.tr(' -', '$$').split('$').map { |word| word[0] }.join.upcase
  end
end
