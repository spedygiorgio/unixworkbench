all: README.md

README.md: guessinggame.sh
	touch README.md
	echo "# Giorgio Alfredo Spedicato assignment for the Coursera Unix Workbench project" >> README.md
	echo "This file has been created at the following date and time:" >> README.md
	echo $$(date) >> README.md
	echo "The bash file guessinggame.sh contains the following number of lines of code, excluding comments (lines beginning with #):" >> README.md
	cat guessinggame.sh | grep "^[^#]" | wc -l >> README.md

clean:
	rm README.md