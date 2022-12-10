require "test/unit"
require_relative "6.rb"

class SixTest < Test::Unit::TestCase

    # Part one samples

    def test_a_sample
        end_index = end_index_of_first_marker_in_string("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 4)
        assert_equal(end_index, 7)
    end

    def test_b_sample
        end_index = end_index_of_first_marker_in_string("bvwbjplbgvbhsrlpgdmjqwftvncz", 4)
        assert_equal(end_index, 5)
    end

    def test_c_sample
        end_index = end_index_of_first_marker_in_string("nppdvjthqldpwncqszvftbrmjlhg", 4)
        assert_equal(end_index, 6)
    end

    def test_d_sample
        end_index = end_index_of_first_marker_in_string("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 4)
        assert_equal(end_index, 10)
    end

    def test_e_sample
        end_index = end_index_of_first_marker_in_string("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 4)
        assert_equal(end_index, 11)
    end

    # Part two samples

    def test_f_sample
        end_index = end_index_of_first_marker_in_string("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14)
        assert_equal(end_index, 19)
    end

    def test_g_sample
        end_index = end_index_of_first_marker_in_string("bvwbjplbgvbhsrlpgdmjqwftvncz", 14)
        assert_equal(end_index, 23)
    end

    def test_h_sample
        end_index = end_index_of_first_marker_in_string("nppdvjthqldpwncqszvftbrmjlhg", 14)
        assert_equal(end_index, 23)
    end

    def test_i_sample
        end_index = end_index_of_first_marker_in_string("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 14)
        assert_equal(end_index, 29)
    end

    def test_j_sample
        end_index = end_index_of_first_marker_in_string("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 14)
        assert_equal(end_index, 26)
    end

    # Inputs

    def test_input_a
        string = string_from_file("input.txt")
        end_index = end_index_of_first_marker_in_string(string, 4)
        assert_equal(end_index, 1578)
    end

    def test_input_b
        string = string_from_file("input.txt")
        end_index = end_index_of_first_marker_in_string(string, 14)
        assert_equal(end_index, 2178)
    end
end
