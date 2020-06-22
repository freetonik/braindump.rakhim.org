clean:
	rm -rf ./content/notes/*

copy:
	cp -a ~/Dropbox/Brain/. ./content/notes
	rm -rf ./content/notes/.obsidian

backlinks:
	~/code/note-link-janitor/dist/index.js ./content/notes

wikilinks:
	./bin/convert_wikilinks_to_refs.sh ./content/notes

frontmatter:
	./bin/add_hugo_frontmatter.py ./content/notes

publish: clean copy backlinks wikilinks frontmatter
	./bin/publish.sh

all: clean copy backlinks wikilinks frontmatter
	@echo "Done"

