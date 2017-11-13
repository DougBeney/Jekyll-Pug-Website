# # # # # # # # # # # 
# This file is for  #
# compiling the     #
# docs & license    #
# file.             #
# # # # # # # # # # #

regex1 = /# Jekyll-Pug\n\n/
regex2 = /## Table [oO]f Contents\n\n([\-\+\w\s\/\.\[\]\(\)#](?!##))+/
regex3 = /({%\s[\w\s\.]+\s%})/
regex4 = /({{\s?[\w\s\.]+\s?}})/
regex5 = /promotional\//

filepath = "src/docs.md"

text = File.read(filepath)
replace = text.gsub(regex1, "")
replace = replace.gsub(regex2, "")

# Escaping tags in docs
replace = replace.gsub(regex3, "{% raw %}\\0{% endraw %}")
replace = replace.gsub(regex4, "{% raw %}\\0{% endraw %}")

# Replacing promotional/ permalink
replace = replace.gsub(regex5, "/static/img/promo/")

File.open(filepath, "w") {|file| file.puts replace}
