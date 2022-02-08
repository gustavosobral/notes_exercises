# Log all pairs of array

boxes = [1, 2, 3, 4, 5]

def log_pairs(arr)
  arr.each do |a|
    arr.each do |b|
      puts "#{a}:#{b}"
    end
  end
end

log_pairs(boxes)
