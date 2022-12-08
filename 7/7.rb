class ElfFile
    attr_accessor :containing_folder
    attr_reader :name, :size

    def initialize(file_string)
        components = file_string.split
        @size = components[0].to_i
        @name = components[1]
    end
end

class ElfFolder
    attr_accessor :containing_folder, :name
    attr_reader :contents

    def initialize()
        @contents = []
    end

    def add(object)
        @contents << object
        object.containing_folder = self
    end

    def folders()
        folders = @contents.filter {|object| object.is_a?(ElfFolder)}
        subfolders = folders.map {|folder| folder.folders}.flatten
        folders = folders.concat(subfolders)
        return folders
    end

    def size()
        size = @contents.map(&:size).sum
        return size
    end
end

class String
    def is_elf_file_line?
        self.start_with?(/\d/)
    end

    def is_elf_folder_line?
        self.start_with?("dir")
    end

    def is_elf_folder_change_command?
        self.start_with?("$ cd")
    end

    def is_elf_folder_list_command?
        self == "$ ls"
    end

    def is_elf_root_folder_command?
        self == "$ cd /"
    end
end

def filesystem_from_lines(lines)
    root_folder = ElfFolder.new()
    root_folder.name = "/"

    current_folder = root_folder

    lines.each do |line|
        puts ""
        puts line

        if line.is_elf_root_folder_command?
            # Skip the root folder command, since we already handled it manually.
            puts "Skipping root folder command"
            next

        elsif line.is_elf_folder_list_command?
            # Skip the folder list command, since it's not something we actually want to parse out.
            puts "Skipping folder list command"
            next
        
        elsif line.is_elf_file_line?
            file = ElfFile.new(line)
            current_folder.add(file)
            puts "Added file: #{file.name}"

        elsif line.is_elf_folder_line?
            folder = ElfFolder.new()
            folder.name = line.split[1]
            current_folder.add(folder)
            puts "Added folder: #{folder.name}"

        elsif line.is_elf_folder_change_command?
            target_folder_name = line.split[2]
            target_folder = nil

            if target_folder_name == ".."
                target_folder = current_folder.containing_folder
                puts "Switched to containing folder"
            else
                target_folder = current_folder.contents.find {|folder| folder.name == target_folder_name}
                puts "Switched to folder #{target_folder.name}"
            end

            current_folder = target_folder
        end
    end

    return root_folder
end

if __FILE__ == $0
    lines = File.readlines("input.txt", chomp: true)
    filesystem = filesystem_from_lines(lines)
    folders = filesystem.folders.filter {|folder| folder.size <= 100000}
    size = folders.map(&:size).reduce(&:+)
    puts size
end
