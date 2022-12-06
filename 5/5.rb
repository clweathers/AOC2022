def stacks_and_moves(filename)
    lines = File.readlines(filename)

    line_length = lines[0].length
    number_of_stacks = number_of_stacks_for_line_length(line_length)

    stacks = Array.new(number_of_stacks) {[]}
    moves = []

    lines.each do |line|
        if line.include? "["
            for stack_index in 0...number_of_stacks do
                stack = stacks[stack_index]
                character_index = character_index_for_stack_index(stack_index)
                crate = line[character_index]
                stack.prepend(crate) if crate != " "
            end
        elsif line.include? "move"
            matches = line.match(/move (?<number_of_boxes>\d+) from (?<start_stack_index>\d+) to (?<end_stack_index>\d+)/)
            number_of_boxes = matches[:number_of_boxes].to_i
            start_stack_index = matches[:start_stack_index].to_i - 1
            end_stack_index = matches[:end_stack_index].to_i - 1
            move = {number_of_boxes: number_of_boxes, start_stack_index: start_stack_index, end_stack_index: end_stack_index}
            moves << move
        end
    end

    return stacks, moves
end

def crates_on_top(stacks)
    crates_on_top = stacks.map(&:last)
    return crates_on_top
end

def rearranged_stacks(stacks, moves)
    stacks = stacks.clone

    moves.each do |move|
        number_of_boxes = move[:number_of_boxes]
        start_stack_index = move[:start_stack_index]
        end_stack_index = move[:end_stack_index]

        start_stack = stacks[start_stack_index]
        end_stack = stacks[end_stack_index]

        number_of_boxes.times do
            crate = start_stack.pop
            end_stack << crate
        end
    end

    return stacks
end

def number_of_stacks_for_line_length(line_length)
    number_of_stacks = (line_length + 1) / 4
    return number_of_stacks
end

def character_index_for_stack_index(stack_index)
    character_index = (stack_index * 4) + 1
    return character_index
end

def rearranged_crates_on_top(filename)
    stacks, moves = stacks_and_moves(filename)
    rearranged_stacks = rearranged_stacks(stacks, moves)
    rearranged_crates_on_top = crates_on_top(rearranged_stacks)
    return rearranged_crates_on_top
end

def rearranged_crates_on_top_string(filename)
    rearranged_crates_on_top = rearranged_crates_on_top(filename)
    rearranged_crates_on_top_string = rearranged_crates_on_top.join
    return rearranged_crates_on_top_string
end

if __FILE__ == $0
    rearranged_crates_on_top_string = rearranged_crates_on_top_string("input.txt")
    puts rearranged_crates_on_top_string
end
