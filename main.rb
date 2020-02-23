require_relative 'pig_latin_translator'
require 'optparse'

# Allow passing a file or string as an argument for translating text
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: main.rb [options]"

  opts.on("-s", "--string", "Run verbosely") do |f|
    options[:string] = f
  end

  opts.on("-f", "--string", "Run verbosely") do |f|
    options[:file] = f
  end

end.parse!

# if string flag is present, treat arguments as text to be translated
# Usage : ruby main.rb -s "String to translate"
# Usage : ruby main.rb -s String to translate
if options[:string]
	puts "Translation:"

	for i in 0 ... ARGV.length
	   print PigLatinTranslator.translate_line(ARGV[i]) + " "
	end

	puts ""
end

# if file flag is present, treat first argument as text file to be translated
# Usage : ruby main.rb -f text.txt output.txt
if options[:file]
	total_translated_text = ""
	File.foreach(ARGV[0]) do |line| 
		total_translated_text += PigLatinTranslator.translate_line(line)+"\n"
		
	end
	File.write(ARGV[1], total_translated_text, mode: "w")
end
