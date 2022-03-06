# Name:  Basic Mathematical Operations
# Level: 8 kyu
# URL:   https://www.codewars.com/kata/57356c55867b9b7a60000bd7 

def basic_op(operator, value1, value2)
  value1.send(operator, value2)
end
