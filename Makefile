
.PHONY: all
all: index.html

index.html: index.adoc
	asciidoctor -r asciidoctor-diagram -r coderay -T ./asciidoctor-deck.js/templates/haml -o $@ $<

