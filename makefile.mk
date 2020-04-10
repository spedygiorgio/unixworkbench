README.md:
	touch README.md
	echo "# Giorgio Alfredo Spedicato assignment for the Unix Workbench project" >> README.md
	current_date_time=`date`
	echo "This file has been created at the following date and time: $current_date_time" >> README.md
	code_lines=`cat guessname.sh | grep "^[^#]" | wc -l`
	echo "The bash file guessname.sh contains $code_lines lines of code, excluding comments (lines beginning with #)" >> README.md
