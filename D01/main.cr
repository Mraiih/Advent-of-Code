class Array
  def find_combination(size : Int)
    self.combinations(size).select! { |comb| comb.sum == 2020 }.flatten
  end
end

lines = File.read_lines("input").map(&.to_i)

# PART ONE
puts lines.find_combination(2).reduce(1) { |acc, i| acc * i }

# PART TWO
puts lines.find_combination(3).reduce(1) { |acc, i| acc * i }
