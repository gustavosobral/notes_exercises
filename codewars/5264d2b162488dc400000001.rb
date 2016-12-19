def spinWords(string)
  string.split.map { |word| word.length > 4 ? word.reverse : word }.join(' ')
end
