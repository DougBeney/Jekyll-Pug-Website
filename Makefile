all:
	echo "Welcome!"

update: update_documentation update_license

update_documentation:
	echo "Adding yaml frontmatter to docs.md"
	@echo "---" > _source/docs.md
	@echo "title: Documentation" >> _source/docs.md 
	@echo "layout: docs" >> _source/docs.md 
	@echo "SEOTitle: Jekyll-Pug Documentation / Tutorial" >> _source/docs.md 
	@echo "SEODescription: Learn how to use the Jekyll-Pug plugin for Jekyll. Create static sites with ease!" >> _source/docs.md 
	@echo "---" >> _source/docs.md 
	@echo "   " >> _source/docs.md 
	echo "Adding content to docs.md"
	@curl https://raw.githubusercontent.com/DougBeney/jekyll-pug/master/README.md >> _source/docs.md
	echo "Running docsRegexReplacer.rb"
	@ruby docsRegexReplacer.rb

update_license:
	echo "Adding yaml frontmatter to license.md"
	@echo "---" > _source/license.md
	@echo "title: License" >> _source/license.md 
	@echo "layout: page" >> _source/license.md 
	@echo "SEOTitle: Jekyll-Pug License" >> _source/license.md 
	@echo "SEODescription: Jekyll-Pug is an open-source project listed under the MIT license." >> _source/license.md
	@echo "---" >> _source/license.md 
	@echo "   " >> _source/license.md 
	echo "Adding content to license.md"
	@curl https://raw.githubusercontent.com/DougBeney/jekyll-pug/master/LICENSE.txt >> _source/license.md
