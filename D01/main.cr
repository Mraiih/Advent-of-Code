class Array
  def find_combination(size : Int)
    self.combinations(size).find(if_none = [0, 0]) { |comb| comb.sum == 2020 }
  end
end

lines = File.read_lines("input").map(&.to_i)

# PART ONE
puts lines.find_combination(2).reduce(1) { |acc, i| acc * i }

# PART TWO
puts lines.find_combination(3).reduce(1) { |acc, i| acc * i }
