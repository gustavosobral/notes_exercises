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
