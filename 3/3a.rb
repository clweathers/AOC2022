def halves_of_string(string)
    half_length = string.length / 2
    first_half = string.slice(0, half_length)
    second_half = string.slice(half_length, half_length)
    return first_half, second_half
end

def common_characters_between_strings(first_string, second_string)
    common_characters = first_string.chars.select {|character| second_string.include?(character)}
    return common_characters
end

def priority_for_character(character)
    lowercase_characters = "abcdefghijklmnopqrstuvwxyz"
    uppercase_characters = lowercase_characters.upcase
    characters = lowercase_characters + uppercase_characters
    priority_for_character = characters.index(character) + 1
    return priority_for_character
end

def priorities_sum_for_filename(filename)
    priorities_sum = 0

    File.readlines(filename).each do |line|
        first_half, second_half = halves_of_string(line)
        common_characters = common_characters_between_strings(first_half, second_half)
        common_character = common_characters.first
        priority = priority_for_character(common_character)
        priorities_sum += priority
    end

    return priorities_sum
end

sum = priorities_sum_for_filename("input.txt")
puts sum
