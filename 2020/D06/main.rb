def parse_input(input)
  infos = []
  while input.count.positive?
    lines = input.take_while { |line| !line.empty? }
    chars = lines.join.chars
    infos << [chars.uniq.count, chars.tally.count { |_, v| v == lines.count }]
    input.shift(lines.count + 1)
  end

  infos
end

input = File.open('input').read.split("\n")
infos = parse_input(input)

# PART ONE
puts infos.reduce(0) { |acc, arr| acc + arr[0] }

# PART TWO
puts infos.reduce(0) { |acc, arr| acc + arr[1] }
