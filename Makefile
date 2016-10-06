DOC_NAME=reposingforces

$(DOC_NAME).html: $(DOC_NAME).raml
	raml2html $< > $@ || (rm $@ && exit 42)
	# if there was an error, the 0-byte HTML file created is removed,
	# and the error effectively propogated.

clean:
	rm $(DOC_NAME).html
