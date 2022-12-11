def operation_for_line(line)
    components = line.split
    instruction = components.at(0).to_sym
    value = components.at(1).to_i
    cycles_to_complete = (instruction == :addx ? 2 : 1)
    operation = {instruction: instruction, value: value, cycles_to_complete: cycles_to_complete}
end

def register_history(filename)
    current_operations = []
    register_value = 1
    register_history = [register_value]

    lines = File.readlines(filename, chomp: true)
    lines.each do |line|
        operation = operation_for_line(line)
        current_operations << operation
        current_operations.each_with_index do |operation, index|
            cycles_to_complete = operation[:cycles_to_complete]
            cycles_to_complete -= 1
            operation[:cycles_to_complete] = cycles_to_complete

            register_history << register_value

            if cycles_to_complete == 0
                value = operation[:value]
                register_value += value
            end

            current_operations = current_operations.filter {|operation| operation[:cycles_to_complete] > 0}
        end
    end

    return register_history
end

if __FILE__ == $0
    register_history = register_history("input.txt")
    signal_strengths = register_history.map.with_index {|register_value, index| register_value * index}
    interesting_signal_indices = [20, 60, 100, 140, 180, 220]
    interesting_signal_strengths = interesting_signal_indices.map {|index| signal_strengths[index]}
    interesting_signal_strengths_sum = interesting_signal_strengths.sum
    puts interesting_signal_strengths_sum
end
