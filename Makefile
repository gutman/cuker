LANGS = 'en' 'ru'
PAGES = 'index' 'models'

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
	@stylus index.styl

nginx :
	tools/install-nginx-config.sh

.PHONY: html css nginx