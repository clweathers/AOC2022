def markers_in_string(string, marker_length)
    markers = []

    string.chars.each_cons(marker_length) do |characters|
        markers << characters.join if characters.size == characters.uniq.size
    end
    
    return markers
end

def first_marker_in_string(string, marker_length)
    markers = markers_in_string(string, marker_length)
    marker = markers.first
    return marker
end

def end_index_of_marker_in_string(marker, string, marker_length)
    start_index = string.index(marker)
    end_index = start_index + marker_length
    return end_index
end

def end_index_of_first_marker_in_string(string, marker_length)
    first_marker = first_marker_in_string(string, marker_length)
    end_index = end_index_of_marker_in_string(first_marker, string, marker_length)
    return end_index
end

def string_from_file(filename)
    string = File.readlines(filename).first.chomp
    return string
end

if __FILE__ == $0
    string = string_from_file("input.txt")
    marker_length = 14
    end_index = end_index_of_first_marker_in_string(string, marker_length)
    puts end_index
end
