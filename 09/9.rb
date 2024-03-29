class Point
    attr_accessor :x, :y

    def initialize(x, y)
        @x = x
        @y = y
    end

    def eql?(point)
        @x == point.x && @y == point.y
    end

    def hash
        hash = (@x * 100) + (@y * 1000)
    end

    def to_s
        "(#{@x}, #{@y})"
    end

    def is_touching(point)
        x_distance = (@x - point.x).abs
        y_distance = (@y - point.y).abs
        is_touching = (x_distance <= 1 && y_distance <= 1)
    end
end

class SnakeSection
    attr_reader :current_point, :previous_points

    def initialize()
        @current_point = Point.new(0, 0)
        @previous_points = []
    end

    def to_s
        @current_point.to_s
    end

    def is_touching(section)
        is_touching = (@current_point.is_touching(section.current_point))
    end

    def move(x, y)
        new_x = @current_point.x + x
        new_y = @current_point.y + y
        new_point = Point.new(new_x, new_y)
        move_to_point(new_point)
    end

    def move_to_point(point)
        @previous_points << @current_point
        @current_point = point
    end

    def move_towards_segment(segment)
        x, y = 0, 0

        x = 1 if segment.current_point.x > @current_point.x
        x = -1 if segment.current_point.x < @current_point.x
        y = 1 if segment.current_point.y > @current_point.y
        y = -1 if segment.current_point.y < @current_point.y

        move(x, y)
    end

    def all_points
        all_points = @previous_points.dup << @current_point
    end
end

def commands_from_file(filename)
    commands = File.readlines(filename, chomp: true)
end

def xy_unit_from_direction(direction)
    x, y = 0, 0

    x = 1 if direction == "R"
    x = -1 if direction == "L"
    y = 1 if direction == "U"
    y = -1 if direction == "D"

    return x, y
end

def direction_and_distance_from_command(command)
    components = command.split
    direction = components[0]
    distance = components[1].to_i
    return direction, distance
end

def points_tail_visited(filename, snake_length)
    snake_sections = Array.new(snake_length) {SnakeSection.new()}

    commands = commands_from_file(filename)
    commands.each do |command|
        direction, distance = direction_and_distance_from_command(command)
        x, y = xy_unit_from_direction(direction)
        distance.times do
            head = snake_sections[0]
            head.move(x, y)
            snake_sections.each_cons(2) do |snake_section_pair|
                first_snake_section = snake_section_pair[0]
                second_snake_section = snake_section_pair[1]
                second_snake_section.move_towards_segment(first_snake_section) if !first_snake_section.is_touching(second_snake_section)
            end
        end
    end

    tail = snake_sections.last
    points_tail_visited = tail.all_points
end

if __FILE__ == $0
    points_tail_visited = points_tail_visited("input.txt", 10)
    number_of_unique_points_tail_visited = points_tail_visited.uniq.size
    puts number_of_unique_points_tail_visited
end
