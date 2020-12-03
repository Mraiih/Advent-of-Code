def parcours_map(map, down, right)
  x = 0
  tree = 0

  0.step(map.length - 1, down) do |y|
    x -= map[y].length if x >= map[y].length
    tree += 1 if map[y][x] == '#'

    x += right
  end

  tree
end

input = File.open('input').readlines.map(&:chomp)

# PART ONE
puts parcours_map(input, 1, 3)

# PART TWO
slope = [[1, 3], [1, 1], [1, 5], [1, 7], [2, 1]]
puts slope.map { |down, right| parcours_map(input, down, right) }.reduce(1, &:*)
