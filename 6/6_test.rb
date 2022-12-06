require "test/unit"
require_relative "6.rb"

class SixTest < Test::Unit::TestCase
    def test_a_sample
        end_index = end_index_of_first_marker_in_string("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
        assert_equal(end_index, 7)
    end

    def test_b_sample
        end_index = end_index_of_first_marker_in_string("bvwbjplbgvbhsrlpgdmjqwftvncz")
        assert_equal(end_index, 5)
    end

    def test_c_sample
        end_index = end_index_of_first_marker_in_string("nppdvjthqldpwncqszvftbrmjlhg")
        assert_equal(end_index, 6)
    end

    def test_d_sample
        end_index = end_index_of_first_marker_in_string("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
        assert_equal(end_index, 10)
    end

    def test_e_sample
        end_index = end_index_of_first_marker_in_string("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
        assert_equal(end_index, 11)
    end

    def test_input
        string = string_from_file("input.txt")
        end_index = end_index_of_first_marker_in_string(string)
        assert_equal(end_index, 1578)
    end
end
