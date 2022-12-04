def halves_of_string(string)
    half_length = string.length / 2
    first_half = string.slice(0, half_length)
    second_half = string.slice(half_length, half_length)
    return first_half, second_half
end

def common_characters_between_strings(strings)
    character_arrays = strings.map {|string| string.chars}
    common_characters = character_arrays.inject do |common_characters, character_array|
        character_array.select {|character| common_characters.include?(character)}
    end
    return common_characters
end

def priority_for_character(character)
    lowercase_characters = ("a".."z").to_a
    uppercase_characters = ("A".."Z").to_a
    characters = lowercase_characters + uppercase_characters
    priority_for_character = characters.index(character) + 1
    return priority_for_character
end

def priorities_sum_a(filename)
    priorities_sum = 0

    File.readlines(filename).each do |line|
        first_half, second_half = halves_of_string(line)
        common_characters = common_characters_between_strings([first_half, second_half])
        common_character = common_characters.first
        priority = priority_for_character(common_character)
        priorities_sum += priority
    end

    return priorities_sum
end

def priorities_sum_b(filename)
    priorities_sum = 0

    File.readlines(filename).each_slice(3) do |lines|
        common_characters = common_characters_between_strings(lines)
        common_character = common_characters.first
        priority = priority_for_character(common_character)
        priorities_sum += priority
    end

    return priorities_sum
end

sum = priorities_sum_b("input.txt")
puts sum
