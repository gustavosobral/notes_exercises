# Name:  Isograms
# Level: 7 kyu
# URL:   https://www.codewars.com/kata/54ba84be607a92aa900000f1

# Mine
def is_isogram(string)
  storage = {}
  string.split('').each do |char|
    normalized_char = char.downcase
    if storage[normalized_char] == nil
      storage[normalized_char] = true
    else
      return false
    end
  end

  true
end

# Best practices
def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end
