install.packages(c("rentrez", "ggplot2"))
library(rentrez)
library(ggplot2)

gene_symbol <- "MYL2"
> transcript_accession <- "NM_000432.4" 
> clinvar_id <- "43479" 
> variant_protein <- "p.Gly162Glu" # Use "" for splice variants
> for (x in c("data", "results", "figures")) {
+   dir.create(x, showWarnings = FALSE)
+ }

> gene_id <- NA_character_
> gene_info <- NULL
> > for (id in hits$ids) {
+   rec <- entrez_summary(db = "gene", id = id)
+ +   if (toupper(rec$name) == toupper(gene_symbol)) {
+     gene_id <- id
+     gene_info <- rec
+     break
+   }
+ }
> > if (is.na(gene_id)) {
+   stop("Exact human gene not found")
+ }
> > print(gene_info)

gb <- entrez_fetch(
  db = "nuccore",
  id = transcript_accession,
  rettype = "gb",
  retmode = "text"
)

pat <- '/protein_id="NP_[0-9]+[.][0-9]+"'

match_location <- regexpr(pat, gb)

if (match_location[1] == -1) {
  stop("NP protein ID not found; inspect the transcript record")
}

fragment <- regmatches(gb, match_location)

protein_accession <- gsub(
  '^/protein_id="|"$',
  '',
  fragment
)

protein_fasta <- entrez_fetch(
  db = "protein",
  id = protein_accession,
  rettype = "fasta",
  retmode = "text"
)

if (length(protein_fasta) == 0 ||
    is.na(protein_fasta[1]) ||
    !startsWith(protein_fasta[1], ">")) {
  stop("Invalid FASTA; check the protein accession")
}

fasta_file <- file.path(
  "data",
  paste0(gene_symbol, "_protein.fasta")
)

writeLines(protein_fasta, fasta_file)

cat("Matched protein:", protein_accession, "\n")

writeLines(
  paste("NP accession:", protein_accession),
  "results/protein_accession.txt"
)


fasta_lines <- readLines(fasta_file)
sequence <- paste(fasta_lines[!grepl("^>", fasta_lines)], collapse = "")
aa <- strsplit(toupper(sequence), "")[[1]]
protein_length <- length(aa)

standard <- strsplit("ACDEFGHIKLMNPQRSTVWY", "")[[1]]
counts <- table(factor(aa, levels = standard))

results <- data.frame(
  AminoAcid = standard,
  Count = as.integer(counts)
)

write.csv(
  results,
  "results/amino_acid_composition.csv",
  row.names = FALSE
)

cat("Protein length:", protein_length, "amino acids\n")
print(head(results[order(-results$Count), ], 3))

fig1 <- ggplot(results, aes(AminoAcid, Count)) +
  geom_col(fill = "lightblue") +
  theme_bw() +
  labs(
    title = paste(gene_symbol, "amino-acid composition"),
    x = "Amino acid",
    y = "Number of residues"
  )

print(fig1)

ggsave(
  "figures/01_amino_acid_composition.png",
  fig1,
  width = 8,
  height = 5,
  dpi = 300
)

# Step 6: Linear protein map for MYL2

variant_protein <- "p.Gly162Glu"

# Extract the affected amino-acid position
matched <- regmatches(
  variant_protein,
  regexpr("[0-9]+", variant_protein)
)

position <- as.integer(matched)

# Check whether the position is within the reference protein
if (is.na(position) ||
    position < 1 ||
    position > protein_length) {
  stop("Variant position does not match the retrieved protein length.")
}

# Create the linear protein map
fig2 <- ggplot() +
  geom_segment(
    aes(
      x = 1,
      xend = protein_length,
      y = 0,
      yend = 0
    ),
    linewidth = 2,
    color = "lightblue"
  ) +
  geom_point(
    aes(x = position, y = 0),
    size = 4,
    color = "red"
  ) +
  annotate(
    "text",
    x = position,
    y = 0.25,
    label = variant_protein,
    size = 4
  ) +
  xlim(0, protein_length) +
  ylim(-0.6, 0.6) +
  theme_void() +
  labs(
    title = paste(gene_symbol, "Reference Protein"),
    subtitle = "Missense variant at amino-acid position 162",
    x = "Amino-acid position"
  ) +
  theme(
    axis.title.x = element_text()
  )

# Display the figure
print(fig2)

# Save the figure
ggsave(
  "figures/02_variant_position.png",
  fig2,
  width = 8,
  height = 2.5,
  dpi = 300
)
