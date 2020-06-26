#!/usr/bin/env python3

import os, sys

def main(argv):
	print("Adding missing top headings for note-link-janitor...")

	dirname = '.'
	dirname = sys.argv[1]
	counter = 0

	for filename in os.listdir(dirname):
		if filename.endswith(".md"):
			filepath = os.path.join(dirname, filename)

			with open(filepath, 'r') as f:
				first_line = f.readline()
				first_chars = first_line[0:2]
				title = first_line[2:-1]

			if first_chars != '# ':
				with open(filepath, 'r+') as f:
					body = f.read()
					f.seek(0, 0)
					f.write("# " + filename[:-3] + "\n\n" + body)

			counter +=1

	print("Done. Processed " + str(counter) + " files.")

if __name__ == "__main__":
   main(sys.argv[1:])
