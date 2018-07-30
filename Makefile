all:
	echo "Welcome!"

netlify:
	npm install -g pug
	jekyll build

update: update_documentation update_license

update_documentation:
	echo "Adding yaml frontmatter to docs.md"
	@echo "---" > src/docs.md
	@echo "title: Documentation" >> src/docs.md 
	@echo "layout: docs" >> src/docs.md 
	@echo "SEOTitle: Jekyll-Pug Documentation / Tutorial" >> src/docs.md 
	@echo "SEODescription: Learn how to use the Jekyll-Pug plugin for Jekyll. Create static sites with ease!" >> src/docs.md 
	@echo "---" >> src/docs.md 
	@echo "   " >> src/docs.md 
	echo "Adding content to docs.md"
	@curl https://gitlab.com/dougbeney/Jekyll-Bliss/raw/2394aba28df1f2d65b0342d2def80e28ea973035/README.md >> src/docs.md
	echo "Running docsRegexReplacer.rb"
	@ruby docsRegexReplacer.rb

update_license:
	echo "Adding yaml frontmatter to license.md"
	@echo "---" > src/license.md
	@echo "title: License" >> src/license.md 
	@echo "layout: page" >> src/license.md 
	@echo "SEOTitle: Jekyll-Pug License" >> src/license.md 
	@echo "SEODescription: Jekyll-Pug is an open-source project listed under the MIT license." >> src/license.md
	@echo "---" >> src/license.md 
	@echo "   " >> src/license.md 
	echo "Adding content to license.md"
	@curl https://raw.githubusercontent.com/DougBeney/jekyll-pug/master/LICENSE.txt >> src/license.md
