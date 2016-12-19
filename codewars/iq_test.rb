# Name:  IQ Test
# Level: 6 kyu
# URL:   https://www.codewars.com/kata/552c028c030765286c00007d/train/ruby


def iq_test(numbers)
  odd_index = 0
  odd_counter = 0
  even_index = 0
  even_counter = 0
  
  numbers.split(' ').each_with_index do |number, index|
    if number.to_i.odd?
      odd_counter += 1 
      odd_index = index
    else
      even_counter +=1
      even_index = index
    end
  end
  
  if even_counter == 1
    even_index + 1
  else
    odd_index + 1
  end
end

def iq_test(numbers)
  nums = numbers.split.map(&:to_i).map(&:even?)
  nums.count(true) > 1 ? nums.index(false) + 1 : nums.index(true) + 1
end
