LANGS = 'en' 'ru'
PAGES = 'index' 'models' 'gallery' 'media' 'testimonials' 'contact'

all : html css

html :
	@for lang in $(LANGS); do \
		for page in $(PAGES); do \
			mkdir -p html/$$lang; \
			yate $$page.yate locale/$$lang.json > html/$$lang/$$page.html; \
			echo "html/$$lang/$$page.html created"; \
		done; \
	done

css :
	@stylus --include-css -r index.styl

nginx :
	tools/install-nginx-config.sh

.PHONY: html css nginx
