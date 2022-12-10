input_string = File.read("input.txt")
input_string << "\n" # Add a second newline to the end so we can easily split the whole string by groups of two newline characters.
pack_strings = input_string.split("\n\n")
packs = pack_strings.map {|pack_string| pack_string.split.map(&:to_i)}
max_pack = packs.inject {|max_pack, pack| max_pack.sum > pack.sum ? max_pack : pack}
max_pack_calories = max_pack.sum
puts max_pack_calories
