all :
	html
	css

html :
	yate index.yate locale/ru.json > index_ru.html
	yate index.yate locale/en.json > index_en.html

css :
	stylus index.styl

.PHONY: html css