all:
	echo "Welcome!"

update: update_documentation update_license

update_documentation:
	echo "---" > docs.md
	echo "title: Documentation" >> docs.md 
	echo "layout: docs" >> docs.md 
	echo "---" >> docs.md 
	echo "   " >> docs.md 
	curl https://raw.githubusercontent.com/DougBeney/jekyll-pug/master/README.md >> docs.md
	sed -i 's/# Jekyll-Pug//g' docs.md 

update_license:
	echo "---" > license.md
	echo "title: License" >> license.md 
	echo "layout: page" >> license.md 
	echo "---" >> license.md 
	echo "   " >> license.md 
	curl https://raw.githubusercontent.com/DougBeney/jekyll-pug/master/LICENSE.txt >> license.md
	sed -i 's/# Jekyll-Pug//g' license.md 
