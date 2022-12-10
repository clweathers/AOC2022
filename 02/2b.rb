@shape_for_symbol = {
    'A' => :rock,
    'B' => :paper,
    'C' => :scissors,
    'X' => :rock,
    'Y' => :paper,
    'Z' => :scissors,
}

@outcome_for_symbol = {
    'X' => :lose,
    'Y' => :draw,
    'Z' => :win,
}

@points_for_shape = {
    rock: 1,
    paper: 2,
    scissors: 3,
}

@points_for_outcome = {
    lose: 0,
    draw: 3,
    win: 6,
}

@winning_shape_for_shape = {
    rock: :paper,
    paper: :scissors,
    scissors: :rock,
}

@losing_shape_for_shape = {
    rock: :scissors,
    paper: :rock,
    scissors: :paper,
}

def outcome_for_match(your_shape, their_shape)
    return :draw if your_shape == their_shape
    return :win if your_shape == @winning_shape_for_shape[their_shape]
    return :lose
end

def your_shape_for_match(their_shape, outcome)
    return @winning_shape_for_shape[their_shape] if outcome == :win
    return @losing_shape_for_shape[their_shape] if outcome == :lose
    return their_shape # Draw
end

def score_for_line(line)
    symbols = line.split

    their_symbol = symbols[0]
    their_shape = @shape_for_symbol[their_symbol]

    outcome_symbol = symbols[1]
    outcome = @outcome_for_symbol[outcome_symbol]

    your_shape = your_shape_for_match(their_shape, outcome)

    points_for_outcome = @points_for_outcome[outcome]
    points_for_shape = @points_for_shape[your_shape]

    score = points_for_outcome + points_for_shape

    return score
end

@total_score = 0

File.readlines("input.txt").each do |line|
    score_for_line = score_for_line(line)
    @total_score += score_for_line
end

puts @total_score
