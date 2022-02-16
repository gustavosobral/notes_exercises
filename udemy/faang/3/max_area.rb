class MaxArea
  # Algorithm: Shifting Pointers
  def self.process(height)
    max_area = 0
    index1 = 0
    index2 = height.size - 1

    while index1 < index2 do
      min_size = height[index1] < height[index2] ? height[index1] : height[index2]
      width = index2 - index1
      area = min_size * width
      max_area = area if area > max_area

      if height[index1] < height[index2]
        index1 +=1
      else
        index2 -=1
      end
    end

    max_area
  end
end
