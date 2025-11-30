using Printf
seq = ""
seq_ID = ""
line_number = 0

open("sequences.fasta"); do file
	for line in eachline(file)
		if startswith(line, ">")
			if !isempty(seq)
				total_bases = length(seq)
				gc_count = count(c -> c in '[G, C]', seq)
				gc_content = (gc_count / total_bases) * 100
				@printf(%s %.2f\n", seq_ID, gc_content)
			end
			seq = ""
			seq_ID = strip(line[2:end])
		else
			seq *= line
		end
	end
end

if !isempty(seq)
	total_bases = length(seq)
	gc_count = count(c -> c in '[G,C]', seq)
	gc_content = (gc_count / total_bases) * 100
	@printf(%s %.2f\n", seq_ID, gc_content)
end