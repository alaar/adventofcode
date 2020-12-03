module AOC2020
  class Day02
    def input(file_name)
      File.open(file_name).read.split("\n")
    end

    def valid_password_part1?(string)
      letter = string.scan(/[a-z]/).first
      password = string.scan(/[a-z]+/).last
      lower_bound = string.scan(/\d+/).first.to_i
      upper_bound = string.scan(/\d+/).last.to_i
      
      password.count(letter).between?(lower_bound, upper_bound)
    end
      
    def valid_password_part2?(string)
      letter = string.scan(/[a-z]/).first
      password = string.scan(/[a-z]+/).last
      index1 = string.scan(/\d+/).first.to_i - 1
      index2 = string.scan(/\d+/).last.to_i - 1
      
      (password[index1] == letter) ^ (password[index2] == letter)
    end
      
    def valid_password_count(data)
      result = 0
      data.each { |string| result += 1 if yield(string) }

      result
    end
  end
end

# day02 = AOC2020::Day02.new
# data = day02.input('input.txt')
# p day02.valid_password_count(data) { |entry| day02.valid_password_part1?(entry) }
# p day02.valid_password_count(data) { |entry| day02.valid_password_part2?(entry) }
