# Name:  Caffeine Script
# Level: 7 kyu
# URL:   https://www.codewars.com/kata/5434283682b0fdb0420000e6/train/ruby


def caffeineBuzz(n)
  str = 'Java' if n % 3 == 0
  str = 'Coffee' if (n % 3 == 0) && (n % 4 == 0)
  if str && n.even?
    str += 'Script' 
  elsif !str
    str = 'mocha_missing!'
  end  
  str
end
