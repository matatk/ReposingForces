DOC_NAME=reposingforces
RAML2HTML=node_modules/.bin/raml2html

$(DOC_NAME).html: $(DOC_NAME).raml
	$(RAML2HTML) $< > $@ || (rm $@ && exit 42)
	# if there was an error, the 0-byte HTML file created is removed,
	# and the error effectively propogated.

open: $(DOC_NAME).html
	open $<

clean:
	-rm $(DOC_NAME).html
