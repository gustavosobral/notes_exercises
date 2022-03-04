# Name:  Multiples of 3 or 5
# Level: 6 kyu
# URL:   https://www.codewars.com/kata/514b92a657cdc65150000006

# Mine
## Notes: Could have used .select and .inject(:+)
def solution(number)
  return 0 if number <= 3

  sum = 0
  (1..(number - 1)).each do |n|
    if (n % 3 == 0) || (n % 5 == 0)
      sum += n
    end
  end

  sum
end

# Best practices
def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end
