def parse_input(input)
  password_policies = input.map { |line| line.chomp.split(/[: -]+/) }
  transposed_policies = password_policies.transpose
  transposed_policies[0] = transposed_policies[0].map(&:to_i)
  transposed_policies[1] = transposed_policies[1].map(&:to_i)

  transposed_policies.transpose
end

input = File.open('input').readlines
password_policies = parse_input(input)

# PART ONE
puts password_policies.count { |min, max, letter, password| password.count(letter).between? min, max }

# PART TWO
puts password_policies.count { |i, j, letter, password| [password[i - 1], password[j - 1]].count(letter) == 1 }