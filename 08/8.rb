def trees(filename)
    lines = File.readlines(filename, chomp: true)
    trees = lines.map {|line| line.chars.map(&:to_i)}
end

def row(index, trees)
    row = trees[index]
end

def column(index, trees)
    column = trees.map {|row| row[index]}
end

# Returns width, height
def dimensions(trees)
    width, height = row(0, trees).size, column(0, trees).size
end

# Part one
# if __FILE__ == $0
#     trees = trees("input.txt")
#     width, height = dimensions(trees)
#     visible_trees = Array.new(width) {Array.new(height)}

#     (0...height).each do |row_index|
#         row = row(row_index, trees)

#         (0...width).each do |column_index|
#             column = column(column_index, trees)

#             tree_height = trees[row_index][column_index]

#             trees_to_left = (column_index > 0 ? row[...column_index] : nil)
#             trees_to_right = (column_index < width - 1 ? row[(column_index + 1)..] : nil)
#             trees_to_top = (row_index > 0 ? column[...row_index] : nil)
#             trees_to_bottom = (row_index < height - 1 ? column[(row_index + 1)..] : nil)

#             visible_from_left = (trees_to_left == nil || tree_height > trees_to_left.max)
#             visible_from_right = (trees_to_right == nil || tree_height > trees_to_right.max)
#             visible_from_top = (trees_to_top == nil || tree_height > trees_to_top.max)
#             visible_from_bottom = (trees_to_bottom == nil || tree_height > trees_to_bottom.max)
            
#             visible = visible_from_left || visible_from_right || visible_from_top || visible_from_bottom
#             visible = (visible ? 1 : 0)

#             visible_trees[row_index][column_index] = visible
#         end
#     end

#     trees.each {|row| p row}
#     puts ""
#     visible_trees.each {|row| p row}
#     puts ""
#     visible_trees_count = visible_trees.inject(0) {|sum, row| sum + row.count(1)}
#     puts visible_trees_count
# end

def visible_trees(trees, tree_height)
    visible_trees = []

    trees.each_with_index do |tree, index|
        visible_trees << tree
        break if tree >= tree_height
    end

    return visible_trees
end

class Array
    def flanks_for_index(index)
        before_flank = []
        before_flank = self[...index] if index > 0

        after_flank = []
        after_flank = self[(index + 1)..] if index < self.size - 1

        return before_flank, after_flank
    end
end

# Part two
if __FILE__ == $0
    trees = trees("input.txt")
    width, height = dimensions(trees)
    scenic_scores = Array.new(width) {Array.new(height)}

    (0...height).each do |row_index|
        row = row(row_index, trees)

        (0...width).each do |column_index|
            column = column(column_index, trees)

            tree_height = trees[row_index][column_index]

            trees_to_left, trees_to_right = row.flanks_for_index(column_index)
            trees_to_top, trees_to_bottom = column.flanks_for_index(row_index)

            visible_to_left = visible_trees(trees_to_left.reverse, tree_height)
            visible_to_right = visible_trees(trees_to_right, tree_height)
            visible_to_top = visible_trees(trees_to_top.reverse, tree_height)
            visible_to_bottom = visible_trees(trees_to_bottom, tree_height)

            scenic_score = visible_to_left.size * visible_to_right.size * visible_to_top.size * visible_to_bottom.size
            scenic_scores[row_index][column_index] = scenic_score

            if row_index == 3 && column_index == 2
                puts "left: #{visible_to_left}"
                puts "right: #{visible_to_right}"
                puts "top: #{visible_to_top}"
                puts "bottom: #{visible_to_bottom}"
            end
        end
    end

    trees.each {|row| p row}
    puts ""
    scenic_scores.each {|row| p row}
    puts ""
    max_scenic_score = scenic_scores.reduce(0) {|max, row| row.max > max ? row.max : max}
    puts max_scenic_score
end
