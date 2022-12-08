require "test/unit"
require_relative "7.rb"

class SevenTest < Test::Unit::TestCase
    def test_file_creation
        elf_file_string = "14848514 b.txt"
        elf_file = ElfFile.new(elf_file_string)
        assert_equal(elf_file.name, "b.txt")
        assert_equal(elf_file.size, 14848514)
    end

    def test_sample_a()
        lines = File.readlines("sample.txt", chomp: true)
        filesystem = filesystem_from_lines(lines)
        folders = filesystem.folders.filter {|folder| folder.size <= 100000}
        size = folders.map(&:size).reduce(&:+)
        assert_equal(size, 95437)
    end

    def test_input_a()
        lines = File.readlines("input.txt", chomp: true)
        filesystem = filesystem_from_lines(lines)
        folders = filesystem.folders.filter {|folder| folder.size <= 100000}
        size = folders.map(&:size).reduce(&:+)
        assert_equal(size, 1232307)
    end
end
