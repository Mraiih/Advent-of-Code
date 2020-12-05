def parse_input(input)
  infos = []
  while input.count.positive?
    collect = {}
    lines = input.take_while { |line| !line.empty? }
    lines.each do |line|
      line.split(' ').map do |info|
        hash = info.split(':')
        collect[hash[0].to_sym] = hash[1]
      end
    end
    infos << collect
    input.shift(lines.count + 1)
  end

  infos
end

def completed_passport?(passport)
  required_fields = %i[byr iyr eyr hgt hcl ecl pid]

  (required_fields - passport.keys).empty?
end

def valid_height(value)
  return false unless %w[cm in].include? value.chars.last(2).join
  return false if value.chars.last(2).join == 'cm' && !value.to_i.between?(150, 193)
  return false if value.chars.last(2).join == 'in' && !value.to_i.between?(59, 76)

  true
end

def valid_passport?(passport)
  return false unless completed_passport?(passport)

  passport.each do |key, value|
    return false if key == :byr && !value.to_i.between?(1920, 2002)
    return false if key == :iyr && !value.to_i.between?(2010, 2020)
    return false if key == :eyr && !value.to_i.between?(2020, 2030)
    return false if key == :hgt && !valid_height(value)
    return false if key == :hcl && !value.match?(/^#[0-9a-f]{6}$/)
    return false if key == :ecl && !%w[amb blu brn gry grn hzl oth].include?(value)
    return false if key == :pid && !value.match?(/^[0-9]{9}$/)
  end

  true
end

input = File.open('input').read.split("\n")
infos = parse_input(input)

# PART ONE
puts infos.count { |passport| completed_passport?(passport) }

# PART TWO
puts infos.count { |passport| valid_passport? passport }