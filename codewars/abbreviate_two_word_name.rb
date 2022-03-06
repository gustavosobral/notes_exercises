# Name:  Abbreviate a Two Word Name
# Level: 8 kyu
# URL:   https://www.codewars.com/kata/57eadb7ecd143f4c9c0000a3

# Notes: By default split already split on " "
def abbrev_name(name)
  name.split(" ").map { |name| name[0].upcase }.join(".")
end
