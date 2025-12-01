## FASTA Utilities Collection (Bash, AWK, Julia)
## Problem Overview
This repository contains a small set of utilities for parsing and analyzing FASTA files across Bash, AWK, and Julia. I built these tools to practice handling biological sequence data from scratch and to understand file I/O and algorithmic thinking before moving on to more complex projects.
## This repository contains
GC Content calculations
K-mer counting (configurable k)
Longest-sequence identification
Nucleotide frequence counts
Start codon identification/scanning
Basic pairwise sequence comparison
Metadata extraction (sequence IDs, lengths, etc.)
Each tool is implemented in at least two languages to cross-check logic and deepen my understanding of different programming paradigms.
## Motivation for this project
When I started learning programming and bioinformatics, I challenged myself to work without external libraries and rely on the languages native text-processing features, best observed with FASTA processing. This project is important to me as it helped me build a strong foundation in sequence analysis workflow design and taught me how to manipulate biological data at a low level.
## What I learned from this project
Efficient line-by-line file processing
Streaming vs buffered parsing approaches
Differences in pattern matching and text processing between Bash, AWK, and Julia
Designing small, testable scripts with inputs and outputs
How fundamental bioinformatics operations, such as GC content, kmers, and codon searching, are impleemnted under the hoood
## Future Directions
Combine the utilities into a unified CLI tool
Add FASTQ support (as seen with Galaxy, for quality score parsing)
Add visualization modules (GC plots, k-mer histograms) with Julia and/or R
Integrate with neighbor-joining and UPGMA project as preprocessing utilities
