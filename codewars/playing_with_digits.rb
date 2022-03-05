# Name:  Playing with digits
# Level: 6 kyu
# URL:   https://www.codewars.com/kata/5552101f47fc5178b1000050

# Mine
## Notes: sum method can accept a block too
def dig_pow(n, p)
  sum = n.digits.reverse.map.with_index { |digit, i| digit ** (p + i) }.sum
  sum % n == 0 ? sum / n : -1
end

def dig_pow(n, p)
  sum = n.digits.reverse.each_with_index.sum{ |d, i| d ** (p + i) }
  
  sum % n == 0 ? sum / n : -1
end
