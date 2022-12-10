require "test/unit"
require_relative "8.rb"

class EightTest < Test::Unit::TestCase
    def test_flanks_at_beginning
        array = [3, 0, 3, 7, 3]
        before_flank, after_flank = array.flanks_for_index(0)
        expected_before = []
        expected_after = [0, 3, 7, 3]
        assert_equal(expected_before, before_flank)
        assert_equal(expected_after, after_flank)
    end

    def test_flanks_at_middle
        array = [3, 0, 3, 7, 3]
        before_flank, after_flank = array.flanks_for_index(2)
        expected_before = [3, 0]
        expected_after = [7, 3]
        assert_equal(expected_before, before_flank)
        assert_equal(expected_after, after_flank)
    end

    def test_flanks_at_end
        array = [3, 0, 3, 7, 3]
        before_flank, after_flank = array.flanks_for_index(array.size - 1)
        expected_before = [3, 0, 3, 7]
        expected_after = []
        assert_equal(expected_before, before_flank)
        assert_equal(expected_after, after_flank)
    end


    # def test_a_sample
    #     answer = _("sample.txt")
    #     assert_equal(answer, _)
    # end

    # def test_a_input
    #     answer = _("input.txt")
    #     assert_equal(answer, _)
    # end

    # def test_b_sample
    #     answer = _("sample.txt")
    #     assert_equal(answer, _)
    # end

    # def test_b_input
    #     answer = _("input.txt")
    #     assert_equal(answer, _)
    # end
end
