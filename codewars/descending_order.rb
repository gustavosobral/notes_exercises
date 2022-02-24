# Name:  Descending Order
# Level: 7 kyu
# URL:   https://www.codewars.com/kata/5467e4d82edf8bbf40000155


# Mine
def descending_order(n)
  n.to_s.split('').sort.reverse.join.to_i
end

# Best practices
def descending_order(n)
  n.to_s.chars.sort.reverse.join.to_i
end
