def santa_delivery(moves)
  grid = {}
  grid.default = 0

  x, y = 0, 0
  moves.each do |direction|
    grid[[x, y]] += 1

    case direction
    when '^' then y -= 1
    when 'v' then y += 1
    when '<' then x -= 1
    when '>' then x += 1
    end
  end

  grid
end

input = File.open('input').read.chars

# PART ONE
puts santa_delivery(input).count

# PART TWO
real_santa_moves = input.select.with_index { |_, i| i.odd? }
robo_santa_moves = input.select.with_index { |_, i| i.even? }
grid_real_santa = santa_delivery(real_santa_moves)
grid_robo_santa = santa_delivery(robo_santa_moves)

puts grid_real_santa.merge(grid_robo_santa).count
