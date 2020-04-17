#calculate the actual number of files in the current directory
actual_numb_files=$(ls -A | wc -l) #taking almos all
#actual_numb_files=$(ls -al | grep '^-' | wc -l) #old approach
#this function compares the given response to actual number of files
#it returns a string that gives the actual results
function compare_guess {
    local delta #function returns this variable
    if [[ $response -gt $actual_numb_files ]]
    then
        delta="too high"
    elif [[ $response -lt $actual_numb_files ]]
    then
        delta="too low"
    else
        delta="correct"
    fi
    echo $delta
}
#initialize the loop
keep="Y"
while [[ "$keep" == "Y" ]]
do
    echo "Guess the number of files in the current directory."
	checknumber="KO"
	while [[ "$checknumber" == "KO" ]] #check input
	do
		echo "Give a non negative number:"
		read response
		if ! [[ $response =~ ^[0-9]+$ ]] #check format
		then
			echo "The input, $response, is not a non negative number. Try again"
			checknumber="KO"
		else
			checknumber="OK"
		fi
	done
    result=$(compare_guess)
    echo "You entered: $response, that is $result." #verify whether keep or not
    if [[ "$result" == "correct" ]]
    then
        echo "Congratulations, you guessed correctly!"
        keep="N"
    else
        echo "Please keep guessing..." #read keep
    fi
done