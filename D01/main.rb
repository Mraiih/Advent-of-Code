class Array
  def find_combination(size)
    self.combination(size).to_a.select { |comb| comb.sum == 2020 }.flatten
  end
end

lines = File.open('input').readlines.map(&:to_i)

# PART ONE
puts lines.find_combination(2).reduce(&:*)

# PART TWO
puts lines.find_combination(3).reduce(&:*)
