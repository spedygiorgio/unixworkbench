# calculate the actual number of files in the current directory
actual_numb_files=$(ls -al | grep '^-' | wc -l) #grep expression keeps only files
keep=Y
while [[ $keep -eq "Y" ]]
do
    echo "Guess the number of files in the current directory" 
    read response
    echo "You entered: $response. Continue?"
    read keep
    echo "Keep is $keep"
done