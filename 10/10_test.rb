require "test/unit"
require_relative "10.rb"

class TenTest < Test::Unit::TestCase
    def test_sample_a
        register_history = register_history("sample.txt")
        signal_strengths = register_history.map.with_index {|register_value, index| register_value * index}
        interesting_signal_indices = [20, 60, 100, 140, 180, 220]
        interesting_signal_strengths = interesting_signal_indices.map {|index| signal_strengths[index]}
        interesting_signal_strengths_sum = interesting_signal_strengths.sum
        assert_equal(13140, interesting_signal_strengths_sum)
    end

    def test_input_a
        register_history = register_history("input.txt")
        signal_strengths = register_history.map.with_index {|register_value, index| register_value * index}
        interesting_signal_indices = [20, 60, 100, 140, 180, 220]
        interesting_signal_strengths = interesting_signal_indices.map {|index| signal_strengths[index]}
        interesting_signal_strengths_sum = interesting_signal_strengths.sum
        assert_equal(12560, interesting_signal_strengths_sum)
    end
end
