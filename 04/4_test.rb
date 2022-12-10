require "test/unit"
require_relative "4.rb"

class FourTest < Test::Unit::TestCase
    def test_a_sample
        answer = number_of_pairs_with_full_overlaps("sample.txt")
        assert_equal(answer, 2)
    end

    def test_a_input
        answer = number_of_pairs_with_full_overlaps("input.txt")
        assert_equal(answer, 524)
    end

    def test_b_sample
        answer = number_of_pairs_with_partial_overlaps("sample.txt")
        assert_equal(answer, 4)
    end

    def test_b_input
        answer = number_of_pairs_with_partial_overlaps("input.txt")
        assert_equal(answer, 798)
    end
end
