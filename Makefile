LANGS = 'en' 'ru'

all : html css

html :
	@for lang in $(LANGS); do \
		mkdir -p html/$$lang; \
		yate index.yate locale/$$lang.json > html/$$lang/index.html; \
		echo "html/$$lang/index.html created"; \
	done

css :
	@stylus index.styl

.PHONY: html css