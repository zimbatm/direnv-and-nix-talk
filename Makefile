
.PHONY: all
all: index.html

index.html: index.adoc
	asciidoctor -T ./asciidoctor-deck.js/templates/haml -o $@ $<

