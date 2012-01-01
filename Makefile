SRC=src
LANGUAGES=$(SRC)/langs
TOOLS=tools
JS_COMP=yuicompressor-2.4.6.jar
BUILD_DIR=build
OUTPUT=P4DV

all: javascript

javascript: merge_javascript
	java -jar $(TOOLS)/$(JS_COMP) -o $(BUILD_DIR)/$(OUTPUT).min.js $(BUILD_DIR)/$(OUTPUT).js

clean_javascript:
	rm -f $(BUILD_DIR)/$(OUTPUT).js
	rm -f $(BUILD_DIR)/$(OUTPUT).min.js

merge_javascript: clean_javascript
	cat $(SRC)/prettify.js >> $(BUILD_DIR)/$(OUTPUT).js
	find $(LANGUAGES) -name "*.js" -exec cat {} >> $(BUILD_DIR)/$(OUTPUT).js \;
	cat $(SRC)/loader.js >> $(BUILD_DIR)/$(OUTPUT).js