#!/usr/bin/env python3

import os, sys

def main(argv):
	dirname = '.'
	dirname = sys.argv[1]
	counter = 0

	for filename in os.listdir(dirname):
		if filename.endswith(".md"):
			filepath = os.path.join(dirname, filename)
			with open(filepath, 'r') as f:
				first_line = f.readline()
				first_char = first_line[0]
				title = first_line[2:-1]

			if first_char == '#':
				with open(filepath, 'r+') as f:
					first_line = f.readline()
					body = f.read()
					f.seek(0, 0)
					f.write("+++\n" + "title = " + '"' + title + '"' +  "\n+++\n\n" + body)

				counter +=1

	print("Done. Processed " + str(counter) + " files.")
		
if __name__ == "__main__":
   main(sys.argv[1:])
