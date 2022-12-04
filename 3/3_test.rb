require "test/unit"
require_relative "3.rb"

class ThreeTest < Test::Unit::TestCase
    def test_a_sample
        sum = priorities_sum_a("sample.txt")
        assert_equal(sum, 157)
    end

    def test_a_input
        sum = priorities_sum_a("input.txt")
        assert_equal(sum, 8252)
    end

    def test_b_sample
        sum = priorities_sum_b("sample.txt")
        assert_equal(sum, 70)
    end

    def test_b_input
        sum = priorities_sum_b("input.txt")
        assert_equal(sum, 2828)
    end
end
