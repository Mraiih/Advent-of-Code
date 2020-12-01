def calc_paper(dimension)
  l, w, h = dimension

  calc_tab = [2 * l * w, 2 * w * h, 2 * h * l]
  calc_tab.sum + calc_tab.min / 2
end

def calc_ribbon(dimension)
  dimension = dimension.sort

  dimension[0] * 2 + dimension[1] * 2 + dimension.reduce(1, &:*)
end

input = File.open('input').readlines.map { |l| l.split('x').map(&:to_i) }

# PART ONE
puts input.reduce(0) { |acc, dimension| acc + calc_paper(dimension) }

# PART TWO
puts input.reduce(0) { |acc, dimension| acc + calc_ribbon(dimension) }
