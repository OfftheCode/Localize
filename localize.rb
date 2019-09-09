## Use this script to generate Strings Struct Faster

## Config
PROJECT_USAGE = TRUE

# Default
output_path = "./"

# Running script

if ARGV.length == 1
    SOURCE_PATH = ARGV[0]
elsif ARGV.length == 2
    SOURCE_PATH = ARGV[0]
    output_path = ARGV[1]
elsif PROJECT_USAGE
    SOURCE_PATH = "./ProjectName/Localization/en.lproj/Localizable.strings"
else
    exit
end

## Helpers

def toCamelCase(word)
    word.split("_").map(&:capitalize).join().gsub("\"", "")
end

## Base of Swift Struct

swiftFile = "import Foundation\n//swiftlint:disable line_length\n\nextension String {\n"

File.open(SOURCE_PATH, "r") do |file|
    puts "Processing..."
    file.each_line do |line|
        if line.match(/^".*"\s=\s".*";/)
            swiftFile += "    static var " + toCamelCase(line.match(/^"\w*"/)[0]) + ": String = { return " + line.match(/^"\w*"/)[0] + ".localized() }()\n"
            elsif line.match(/\/\/ \w+/)
            swiftFile += "\n // MARK: - " + line.gsub("/", "").strip + "\n"
        end
    end
    swiftFile += "}\n//swiftlint:enable line_length"
    file.close # should be done automaticly but U never know
end

rezolveStringsFile = File.new(output_path, "w")

rezolveStringsFile.puts(swiftFile)

rezolveStringsFile.close

puts "Finished converting, output file at: " + output_path

