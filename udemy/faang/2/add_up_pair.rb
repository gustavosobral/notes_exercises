class AddUpPair
  def self.process(nums, target)
    nums_to_find = {}

    nums.each_with_index do |p, index|
      if !nums_to_find[p].nil?
        return [nums_to_find[p], index]
      else
        num_to_find = target - p
        nums_to_find[num_to_find] = index
      end
    end

    nil
  end

  # Algorithm: Two Pointers Technique
  def self.processV1(array, target)
    return if array.empty? || array.size == 1

    array.each_with_index do |p1, index1|
      array[(index1+1)..].each_with_index do |p2, index2|
        return [index1, index2+index1+1] if p1 + p2 == target 
      end
    end
    
    nil
  end
end
