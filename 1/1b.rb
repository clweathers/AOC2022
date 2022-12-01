input_string = File.read("input.txt")
input_string << "\n" # Add a second newline to the end so we can easily split the whole string by groups of two newline characters.
pack_strings = input_string.split("\n\n")
packs = pack_strings.map {|pack_string| pack_string.split.map(&:to_i)}
sorted_packs = packs.sort_by {|pack| pack.sum}
sorted_packs.reverse!
top_packs = sorted_packs.slice(0..2)
calories = top_packs.sum {|pack| pack.sum}
p calories
