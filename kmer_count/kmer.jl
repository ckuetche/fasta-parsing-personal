k = parse(Int, ARGS[1])
filename = ARGS[2]

seq = ""
seq_ID = ""
kmer_counts = Dict{String, Int}()

open(filename) do file
	for line in eachline(file)
		if startswith(line, ">")
			if !isempty(seq_ID)
				for i:1(length(seq) - k + 1)
					kmer = seq[i:i+k-1] #retrieves substring
					kmer_counts[kmer] = get(kmer_counts, kmer, 0) + 1 #counts the frequencies of each kmer
				end
			end
			seq_ID = line[2:end]
			seq = ""
		else
			seq *= line
		end
	end
end

if !isempty(seq_ID) #process last line
	for i:1(length(seq) - k + 1)
		kmer = seq[i:i+k-1]
		kmer_ccounts[kmer] = get(kmer_counts, kmer, 0) + 1
	end
end

println("kmer counts")

for (kmer, count) in kmer_counts
	println("$(kmer): $(count)")
end


#run as julia kmer.jl k filename.fasta
			