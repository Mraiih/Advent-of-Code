def calc(string)
  string.chars.map { |letter| letter.tr!('BFRL', '1010') }.join.to_i(2)
end

ids = File.open('input').readlines.map { |id| calc(id[0..6]) * 8 + calc(id[7..9]) }

# PART ONE
puts ids.max

# PART TWO
puts ids.reject { |id| ids.include?(id + 1) }.min + 1
