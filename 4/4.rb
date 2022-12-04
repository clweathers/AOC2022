class Assignment
    attr_reader :first_section, :last_section

    def initialize(assignment_string)
        first_section, last_section = self.class.sections_from_assignment_string(assignment_string)
        @first_section = first_section
        @last_section = last_section
    end

    def self.sections_from_assignment_string(assignment_string)
        sections = assignment_string.split("-").map(&:to_i)
        return sections[0], sections[1]
    end

    def fully_contains(assignment)
        @first_section <= assignment.first_section && @last_section >= assignment.last_section
    end

    def overlaps_with(assignment)
        does_not_overlap = @last_section < assignment.first_section || @first_section > assignment.last_section
        overlaps = !does_not_overlap
        return overlaps
    end
end

def number_of_pairs_with_full_overlaps(filename)
    pairs_with_full_overlaps = []

    File.readlines(filename).each do |line|
        assignments = line.split(",")
        first_assignment = Assignment.new(assignments[0])
        second_assignment = Assignment.new(assignments[1])
        pairs_with_full_overlaps << [first_assignment, second_assignment] if first_assignment.fully_contains(second_assignment) || second_assignment.fully_contains(first_assignment)
    end

    number_of_pairs_with_full_overlaps = pairs_with_full_overlaps.size
    return number_of_pairs_with_full_overlaps
end

def number_of_pairs_with_partial_overlaps(filename)
    pairs_with_partial_overlaps = []

    File.readlines(filename).each do |line|
        assignments = line.split(",")
        first_assignment = Assignment.new(assignments[0])
        second_assignment = Assignment.new(assignments[1])
        pairs_with_partial_overlaps << [first_assignment, second_assignment] if first_assignment.overlaps_with(second_assignment)
    end

    number_of_pairs_with_partial_overlaps = pairs_with_partial_overlaps.size
    return number_of_pairs_with_partial_overlaps
end

if __FILE__ == $0
    number_of_pairs_with_partial_overlaps = number_of_pairs_with_partial_overlaps("input.txt")
    puts number_of_pairs_with_partial_overlaps
end
