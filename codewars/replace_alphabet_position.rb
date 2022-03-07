# Name:  Replace With Alphabet Position
# Level: 6 kyu
# URL:   https://www.codewars.com/kata/546f922b54af40e1e90001da

# Mine
def alphabet_position(text)
  text.chars.map do |c|
    ascii = c.downcase.ord
    next if ascii < 97 || ascii > 122
    ascii - 96
  end.compact.join(' ')
end
