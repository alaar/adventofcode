module AOC2020
  class Day03
    attr_accessor :input, :width, :height

    def initialize(file_name)
        @input = AOC2020::Day03.input(file_name)
        @width = @input[0].length
        @height = @input.length
    end

    def self.input(file_name)
      File.open(file_name).read.split("\n")
    end

    def tree?(i, j)
        @input[j][i] == '#'
    end

    def count_trees(right, down)
      i = 0
      j = 0 
      trees = 0

      while j < @height
          adjusted_i = i % @width
          trees += 1 if tree?(adjusted_i, j)
          i += right
          j += down
      end

      trees
     end
  end
end
  
# day03 = AOC2020::Day03.new('input.txt')
# p day03.count_trees(3, 1)
# p [[1,1],[3,1],[5,1],[7,1],[1,2]].map { |coordinates| day03.count_trees(coordinates[0], coordinates[1]) }.reduce(:*)