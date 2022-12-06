def markers_in_string(string)
    markers = []

    string.chars.each_cons(4) do |characters|
        markers << characters.join if characters.size == characters.uniq.size
    end
    
    return markers
end

def first_marker_in_string(string)
    markers = markers_in_string(string)
    marker = markers.first
    return marker
end

def end_index_of_marker_in_string(marker, string)
    start_index = string.index(marker)
    end_index = start_index + marker.length
    return end_index
end

def end_index_of_first_marker_in_string(string)
    first_marker = first_marker_in_string(string)
    end_index = end_index_of_marker_in_string(first_marker, string)
    return end_index
end

def string_from_file(filename)
    string = File.readlines(filename).first.chomp
    return string
end

if __FILE__ == $0
    string = string_from_file("input.txt")
    end_index = end_index_of_first_marker_in_string(string)
    puts end_index
end
