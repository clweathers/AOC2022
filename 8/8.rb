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

if __FILE__ == $0
    trees = trees("input.txt")
    width, height = dimensions(trees)
    visible_trees = Array.new(width) {Array.new(height)}

    (0...height).each do |row_index|
        row = row(row_index, trees)

        (0...width).each do |column_index|
            column = column(column_index, trees)

            tree_height = trees[row_index][column_index]

            trees_to_left = (column_index > 0 ? row[...column_index] : nil)
            trees_to_right = (column_index < width - 1 ? row[(column_index + 1)..] : nil)
            trees_to_top = (row_index > 0 ? column[...row_index] : nil)
            trees_to_bottom = (row_index < height - 1 ? column[(row_index + 1)..] : nil)

            visible_from_left = (trees_to_left == nil || tree_height > trees_to_left.max)
            visible_from_right = (trees_to_right == nil || tree_height > trees_to_right.max)
            visible_from_top = (trees_to_top == nil || tree_height > trees_to_top.max)
            visible_from_bottom = (trees_to_bottom == nil || tree_height > trees_to_bottom.max)
            
            visible = visible_from_left || visible_from_right || visible_from_top || visible_from_bottom
            visible = (visible ? 1 : 0)

            visible_trees[row_index][column_index] = visible
        end
    end

    trees.each {|row| p row}
    puts ""
    visible_trees.each {|row| p row}
    puts ""
    visible_trees_count = visible_trees.inject(0) {|sum, row| sum + row.count(1)}
    puts visible_trees_count
end
