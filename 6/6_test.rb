require "test/unit"
require_relative "6.rb"

class SixTest < Test::Unit::TestCase
    def test_a_sample
        answer = _("sample.txt")
        assert_equal(answer, _)
    end

    def test_a_input
        answer = _("input.txt")
        assert_equal(answer, _)
    end

    def test_b_sample
        answer = _("sample.txt")
        assert_equal(answer, _)
    end

    def test_b_input
        answer = _("input.txt")
        assert_equal(answer, _)
    end
end
