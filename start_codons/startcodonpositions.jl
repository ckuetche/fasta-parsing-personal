#!/bin/julia



if length(ARGS) == 0
	println("no file provided")
	exit(1)
end

filename = ARGS[1]

seq = ""

seq_ID = ""

positions_list = Integer[]

open(filename) do line
	if startswith(line, ">")
		if !isempty(seq_ID)
			for i in 1:(length(seq)-2)
				codon = seq[i:i+2]
					if codon == "ATG"
						push!(positions_list, i)
					end
			end
			println("positions for start codon")
				
			for pos in positions_list
				println("$(pos)")
			end
			positions_list = Integer[]
		end
		seq_ID = line[2:end]
		seq=""
	else
		seq *= line
	end
end

if !isempty(seq_ID)
	for i in 1:(length(seq)-2)
		codon = seq[i:i+2]
			if codon == "ATG"
				push!(positions_list, i)
			end
	end
	println("positions for start codon")
	
	for pos in positions_list
		println("$(pos)")
	end
end


	
					
