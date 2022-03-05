# Name:  Sum of Digits / Digital Root
# Level: 6 kyu
# URL:   https://www.codewars.com/kata/541c8630095125aba6000c00

# Mine
## Notes: Could have used Integer .digits method
##        Could have used Array .sum method
def digital_root(n)
  result = n.to_s.chars.map(&:to_i).inject(:+)
  return result if result.to_s.size == 1

  digital_root(result)
end

# Best practices
def digital_root(n)
  n < 10 ? n : digital_root(n.digits.sum)
end
