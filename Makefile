SCHEMA_DIR=docs/schema
SCHEMATA_DIR=docs/schema/schemata

SCHEMA_COMBINED_JSON=$(SCHEMA_DIR)/schema.json
SCHEMA_MD=$(SCHEMA_DIR)/schema.md
SCHEMA_HTML=$(SCHEMA_DIR)/schema.html

RM=rm
PANDOC=pandoc
PRMD=prmd

.PHONY: all clean docs opendocs test

all: docs


#
# Schema-based API docs
#

docs: $(SCHEMA_HTML)

$(SCHEMA_COMBINED_JSON): $(SCHEMA_DIR)/meta.json $(SCHEMATA_DIR)/*
	$(PRMD) combine --meta $^ > $@
	$(PRMD) verify $@

$(SCHEMA_MD): $(SCHEMA_DIR)/overview.md $(SCHEMA_COMBINED_JSON)
	$(PRMD) doc --prepend $^ > $(SCHEMA_MD)

$(SCHEMA_HTML): $(SCHEMA_MD)
	$(PANDOC) \
		--to html5 \
		--standalone \
		--toc \
		--section-divs \
		--css schema.css \
		--output $@ \
		$<

opendocs: $(SCHEMA_HTML)
	open $<


#
# Testing
#

test:
	@echo TBD!


#
# Cleanup
#

clean:
	-$(RM) \
		$(SCHEMA_COMBINED_JSON) \
		$(SCHEMA_MD) \
		$(SCHEMA_HTML) \
		*.pyc
