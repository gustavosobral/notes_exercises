# Name:  Stop gninnipS My sdroW!
# Level: 6 kyu
# URL:   https://www.codewars.com/kata/5264d2b162488dc400000001/train/ruby


def spinWords(string)
  string.split.map { |word| word.length > 4 ? word.reverse : word }.join(' ')
end
