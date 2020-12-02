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
moves = input.partition.with_index { |_, i| i.odd? }
real_santa = santa_delivery(moves[0])
robo_santa = santa_delivery(moves[1])

puts real_santa.merge(robo_santa).count
