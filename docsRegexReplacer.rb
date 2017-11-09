# # # # # # # # # # # 
# This file is for  #
# compiling the     #
# docs & license    #
# file.             #
# # # # # # # # # # #

regex1 = /# Jekyll-Pug\n\n/
regex2 = /## Table [oO]f Contents\n\n([-\w\s\[\]\(\)#](?!##))+/
regex3 = /({%\s[\w\s\.]+\s%})/

filepath = "_source/docs.md"

text = File.read(filepath)
replace = text.gsub(regex1, "")
replace = replace.gsub(regex2, "")

# Escaping tags in docs
replace = replace.gsub(regex3, "{% raw %}\\0{% endraw %}")

File.open(filepath, "w") {|file| file.puts replace}
