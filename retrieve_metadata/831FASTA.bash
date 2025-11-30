#extract sequence IDs by isolating > character 

grep -oE ">.*" | sed "s/>//" sequences.fasta


while IFS= read -r line; do
    if [[ $line == ">"*]]; then
        echo "${line#>}"
    fi
done < sequences.fasta

#count the number of sequences using a pipeline

grep "^>" sequences.fasta | wc -l sequences.fasta | awk '{print "Number of sequences:", $1}' sequences.fasta

count=0
while IFS= read -r line; do
    if [[ $line == ">"* ]]; then
        count=$((count+1))
    fi
done < sequences.fasta
echo "Number of sequences: $count"

#for each sequence, print the sequence ID and the sequence length

seq="" #initialize both variables
seq_ID=""
while IFS= read -r line; do #process line by line
    if [[ $line == ">"*]]; then #handles header case first
        if [[ -n "$seq_ID"]]; then #equivalent of NR>1
        echo "$seq_ID $(echo -n seq | tr -d -c 'A-Za-z' | wc -c)" #prints out the previous seq_ID and seq length (wordcount), cleans sequence and captures output
        fi
    seq_ID=${line#>} #everything after >
    seq=""
    else
        seq+=${line//[^A-Za-z]/} #updates sequence
    fi
done < sequences.fasta

#print out last sequence in the end
if [[ -n "$seq_ID"]]; then 
    echo "$seq_ID $(echo -n seq | tr -d -c 'A-Za-z' | wc -c)" 
fi