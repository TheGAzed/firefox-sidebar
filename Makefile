# Variables
ZIP_TOOL := zip
ZIP_FLAGS := -r
TARGET_DIRS := $(wildcard *-sb)
OUTPUT_DIR := zips

# Rule to zip all directories ending in -sb
all: $(TARGET_DIRS)
	mkdir -p $(OUTPUT_DIR)
	@for dir in $(TARGET_DIRS); do \
		zip_file="$(OUTPUT_DIR)/$${dir}.zip"; \
		cd "$$dir"; \
		echo "Zipping $$dir into $$zip_file..."; \
		$(ZIP_TOOL) $(ZIP_FLAGS) ../"$$zip_file" *; \
		cd ..; \
		cp "$$zip_file" "$(OUTPUT_DIR)/$${dir}.xpi"; \
	done

# Clean the output directory
clean:
	rm -rf $(OUTPUT_DIR)

.PHONY: zip clean
