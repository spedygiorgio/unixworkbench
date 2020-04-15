#calculate the actual number of files in the current directory
actual_numb_files=$(ls -al | grep '^-' | wc -l) #grep expression keeps only files
#this function compares the given response to actual number of files
#it returns a string that gives the actual results
function compare_guess {
    local delta #this variable will be returned
    #response and actual_numb_files are global variable
    if [[ $response -gt $actual_numb_files ]]
    then
        delta="too high"
    elif [[ $response -lt $actual_numb_files ]]
    then
        delta="too low"
    else
        delta="guessed"
    fi
    echo $delta
}
#initialize the loop
keep="Y"
while [[ "$keep" == "Y" ]]
do
    echo "Guess the number of files in the current directory. Give a number:"
    read response
    result=$(compare_guess)
    echo "You entered: $response, that is $result."
    #verify whether keep or not
    if [[ "$result" == "guessed" ]]
    then
        echo "Congratulations, you guessed correctly!"
        keep="N"
    else
        echo "Please keep guessing..."
        #read keep
    fi
done