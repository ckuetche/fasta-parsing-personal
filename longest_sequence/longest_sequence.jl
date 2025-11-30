seq = ""
seq_ID = ""
max_length = 0
longest_ID = ""

open("sequences.fasta") do file
	for line in eachline(file)
		if startswith(line, ">")
			if !isempty(seq_ID)
				if (length(seq) > max_length)
					max_length = length(seq)
					longest_ID = seq_ID
				end
			end
			seq_ID = line[2:end]
			seq = ""
		else
			seq *= line
		end
	end
end

if !isempty(seq_ID)
	if (length(seq) > max_length)
		max_length = length(seq)
		longest_ID = seq_ID
	end
end

println(longest_ID, " ", max_length)
				
