module AOC2020
  class Day01
    def input(file_name)
      File.open(file_name).read.split("\n").map {|entry| entry.to_i }
    end
    
    def product_of_two(nums, sum)
      len = nums.size - 1
      for i in (0..len)
        missing = sum - nums[i]
        return missing * nums[i] if (nums.slice(i+1, len).include?(missing))
      end
    end
    
    def has_two_factors?(nums, sum)
      len = nums.size - 1
      for i in (0..len)
        missing = sum - nums[i]
        return true if nums.slice(i+1, len).include?(missing)
      end
    
      false
    end
    
    def product_of_three(nums, sum)
      len = nums.size - 1
      for i in (0..len)
        missing = sum - nums[i]
        partial = nums.slice(i+1, len)
        return nums[i]* product_of_two(partial, missing) if has_two_factors?(partial, missing)
      end
    end
  end 
end

# day01 = AOC2020::Day01.new
# data = day01.input('input.txt')
# p day01.product_of_two(data, 2020)
# p day01.product_of_three(data, 2020)
