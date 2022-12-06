require "test/unit"
require_relative "5.rb"

class FiveTest < Test::Unit::TestCase
    def test_a_sample
        answer = rearranged_crates_on_top("sample.txt")
        assert_equal(answer, "CMZ")
    end

    def test_a_input
        answer = rearranged_crates_on_top("input.txt")
        assert_equal(answer, "RTGWZTHLD")
    end

    def test_b_sample
        move_multiple_crates_at_once = true
        answer = rearranged_crates_on_top("sample.txt", move_multiple_crates_at_once)
        assert_equal(answer, "MCD")
    end

    def test_b_input
        move_multiple_crates_at_once = true
        answer = rearranged_crates_on_top("input.txt", move_multiple_crates_at_once)
        assert_equal(answer, "STHGRZZFR")
    end
end
