#!/bin/Julia

#count all the bases and organize them into a bin

#can use a generator expression like Channel that slowly returns 1 output to another function for slow consumption

#define binning function first
bins = Dict("short" => String[], "medium" => String[], "long" => String[])

function binsequence(seq_ID::String, len::Int, bins::Dict{String, Vector{String}})
	if len < 100
		push!(bins["short"], seq_ID)
	elseif len <= 500
		push!(bins["medium"], seq_ID)
	else
		push!(bins["long"], seq_ID)
	end
end

#create lazy generator

function fasta_channel(filename)
	return Channel{Tuple{String,Int}}(c -> begin #always begin with this particular return statement
		seq = ""
		seq_ID = ""
		open(filename, "r") do io
			for line in eachline(io)
				if startswith(line, ">")
					if !isempty(seq_ID)
						put!(c, (seq_ID, length(seq)))
					end
					seq_ID = line[2:end]
					seq = ""
				else
					seq *= line
				end
			end
			if !isempty(seq_ID)
				put!(c, (seq_ID, length(seq)))
			end
		end
	end)
end


function main() #put everything in one place
	if length(ARGS) == 0
		println("Usage: Julia script.jl <fasta_file>") #tells the user what to input
		return
	end
	filename = ARGS[1]
	
	bins = Dict("short" => String[], "medium" => String[], "long" => String[])
	for (seq_ID, len) in fasta_channel(filename)
		binsequence(seq_ID, len, bins)
	end
	
	for (bin, ids) in bins
		println("$bin: $(length(ids)) sequences")
	end
end

main()






	
	
		
			



