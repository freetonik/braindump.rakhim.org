clean:
	@echo "Cleaning files..."
	rm -rf ./content/notes/*
	@echo "Done!"
	@echo "-----"

copy:
	@echo "Copying fresh files..."
	cp -a ~/Dropbox/Brain/. ./content/notes
	rm -rf ./content/notes/.obsidian
	rm -rf ./content/journal
	@echo "Done!"
	@echo "-----"

heading:
	./bin/add_top_heading.py ./content/notes
	@echo "-----"

backlinks:
	@echo "Generating backlinks..."
	~/code/note-link-janitor/dist/index.js ./content/notes
	@echo "Done!"
	@echo "-----"

wikilinks:
	./bin/convert_wikilinks_to_refs.sh ./content/notes
	@echo "-----"

frontmatter:
	./bin/add_hugo_frontmatter.py ./content/notes
	@echo "Done!"
	@echo "-----"

publish: all
	./bin/publish.sh
	@echo "Done!"
	@echo "-----"

all: clean copy heading backlinks wikilinks frontmatter
	@echo "ALL DONE!"
