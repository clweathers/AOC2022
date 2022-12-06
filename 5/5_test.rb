require "test/unit"
require_relative "5.rb"

class FiveTest < Test::Unit::TestCase
    def test_a_sample
        answer = rearranged_crates_on_top_string("sample.txt")
        assert_equal(answer, "CMZ")
    end

    def test_a_input
        answer = rearranged_crates_on_top_string("input.txt")
        assert_equal(answer, "RTGWZTHLD")
    end

    # def test_b_sample
    #     answer = _("sample.txt")
    #     assert_equal(answer, 1)
    # end

    # def test_b_input
    #     answer = _("input.txt")
    #     assert_equal(answer, 1)
    # end
end
