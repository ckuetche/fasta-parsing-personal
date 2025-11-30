#print sequenceID and GC content for each sequence

using Printf #important for output
seq_ID=""
seq=""
open("sequences.fasta") do file #process file line by line
    line_number = 0
    for line in eachline(file)
        line_number += 1
        if startswith(line, ">") #handle header case
            if ! isempty(seq_ID) #handle previous sequence
                total_bases = length(seq)
                gc_count = count(c -> c in ['G', 'C'], seq) #count G,C 
                gc_content = (gc_count / total_bases) * 100
                @printf("%s. %.2f\n", seq_ID, gc_content) #print with 2 decimal places
            end
        seq_ID = strip(line[2:end]) #isolate ID
        seq = ""
        else
            seq *= line #update sequence
        end
    end
end

if ! isempty(seq_ID) #handle last line
    total_bases = length(seq)
    gc_count = count(c -> c in ['G', 'C'], seq)
    gc_content = (gc_count / total_bases) * 100
    @printf("%s. %.2f\n", seq_ID, gc_content)
end

#find the longest sequence

seq_ID = ""
seq = ""
longest_ID = ""
max_length = ""
open("sequences.fasta") do file
    line_number = 0
    if startswith