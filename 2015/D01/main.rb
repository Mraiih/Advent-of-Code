class Array
  def find_position(current_floor)
    self.each_with_index do |n, i|
      current_floor += n
      return i + 1 if current_floor == -1
    end
  end
end

input = File.open('input').read.chomp.chars.map { |c| c == '(' ? 1 : -1 }

# PART ONE
puts input.sum

# PART TWO
puts input.find_position(0)
