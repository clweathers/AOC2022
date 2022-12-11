require "test/unit"
require_relative "9.rb"

class NineTest < Test::Unit::TestCase
    def test_point_is_touching
        x = 2
        y = 2

        left_x = x - 1
        right_x = x + 1
        upper_y = y - 1
        lower_y = y + 1

        point = Point.new(x, y)

        upper = Point.new(x, upper_y)
        lower = Point.new(x, lower_y)

        left_upper = Point.new(left_x, upper_y)
        left = Point.new(left_x, y)
        left_lower = Point.new(left_x, lower_y)
        
        right_upper = Point.new(right_x, upper_y)
        right = Point.new(right_x, y)
        right_lower = Point.new(right_x, lower_y)

        assert_equal(true, point.is_touching(upper))
        assert_equal(true, point.is_touching(lower))

        assert_equal(true, point.is_touching(left_upper))
        assert_equal(true, point.is_touching(left))
        assert_equal(true, point.is_touching(left_lower))

        assert_equal(true, point.is_touching(right_upper))
        assert_equal(true, point.is_touching(right))
        assert_equal(true, point.is_touching(right_lower))
    end

    def test_sample_a
        points_tail_visited = points_tail_visited("sample.txt")
        number_of_unique_points_tail_visited = points_tail_visited.uniq.size
        assert_equal(13, number_of_unique_points_tail_visited)
    end

    def test_input_a
        points_tail_visited = points_tail_visited("input.txt")
        number_of_unique_points_tail_visited = points_tail_visited.uniq.size
        assert_equal(6044, number_of_unique_points_tail_visited)
    end
end
