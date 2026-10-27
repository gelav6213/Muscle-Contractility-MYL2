# MYL2 Muscle Contractility Variant Analysis

## a. Assignment Information

- Student number: 09
- Gene: MYL2
- Transcript: NM_000432.4
- Variant: c.485G>A (p.Gly162Glu)
- ClinVar Variation ID: 43479

## b. Research Question

How might the MYL2 p.Gly162Glu variant affect the molecular function of
myosin regulatory light chain 2 and muscle contraction?

## c. Methods

### Step 1. R Project Setup
A GitHub repository named `Muscle-Contractility-MYL2` was created. The project was organized into `data`, `results`, and `figures` folders, with `analysis.R` containing the R code used for the analysis. The R packages `rentrez` and `ggplot2` were installed and loaded.

### Step 2. NCBI Gene Retrieval
The **MYL2** gene was searched in the NCBI Gene database using the human organism filter (`txid9606[Organism]`). The exact human gene record was verified, and the NCBI Gene ID, official gene name, and chromosome information were recorded in `results/gene_summary.txt`.

### Step 3. Reference Transcript and Protein Retrieval
The assigned RefSeq transcript **NM_000432.4** was retrieved from NCBI using the `rentrez` package. The matching RefSeq protein accession was obtained from the transcript record, and the corresponding protein FASTA sequence was downloaded and saved as `data/MYL2_protein.fasta`. The protein accession was also recorded in `results/protein_accession.txt`.

### Step 4. Protein Composition
The FASTA sequence was read in R and analyzed to determine the number of each of the 20 standard amino acids. The results were saved as `results/amino_acid_composition.csv`, and a bar graph showing amino-acid composition was created and saved as `figures/01_amino_acid_composition.png`. The three most abundant amino acids were identified from the resulting counts.

### Step 5. ClinVar Variant Analysis
The assigned ClinVar variant, **ClinVar Variation ID 43479**, was manually examined using the ClinVar database. The current variant name, HGVS notation, variant type, associated condition, aggregate classification, review status, supporting evidence, and access date were recorded. The assigned variant **NM_000432.4:c.485G>A (p.Gly162Glu)** was retained for the analysis.


### Step 6. Biological Visualization
Because the assigned variant is a **missense variant**, a linear protein map was created to show the MYL2 reference protein and the location of the affected amino-acid residue, **Gly162**. The figure was saved as `figures/02_variant_position.png`. 

## d. Results

- [View MYL2 Summary](https://github.com/gelav6213/Muscle-Contractility-MYL2/blob/main/Results/MYL2_summary.txt)
- [View protein accession](https://github.com/gelav6213/Muscle-Contractility-MYL2/blob/main/Results/protein_accession.txt)
- [View amino acid composition](https://github.com/gelav6213/Muscle-Contractility-MYL2/blob/main/Results/amino_acid_composition.csv)

## d. Figures
- 01_amino_acid_composition.png
<img width="2400" height="1500" alt="1055" src="https://github.com/user-attachments/assets/8b00b004-05da-484f-89d5-5a31027d6a8e" />

- 02_variant_position.png
<img width="2400" height="750" alt="1058" src="https://github.com/user-attachments/assets/0c040b8e-e934-4257-b2a9-19ef639e3ed9" />

## (e) Variant Interpretation

The **MYL2** gene encodes myosin regulatory light chain 2, a protein involved in regulating myosin function during muscle contraction, particularly in cardiac muscle. The assigned variant, **NM_000432.4:c.485G>A (p.Gly162Glu)**, is a missense variant that changes the amino acid glycine to glutamic acid at position 162 of the protein.

This amino acid substitution may affect the protein's structure or function, potentially influencing normal cardiac muscle contraction. However, the actual effect of this specific variant cannot be concluded from the sequence change alone. Its interpretation should consider the current ClinVar classification, available experimental evidence, and any computational predictions. A clinical association or computational prediction alone does not prove that the variant directly causes a functional change.

### Limitations

This analysis uses the MYL2 reference sequence, amino-acid composition, variant information, and ClinVar classifications. These sources help identify the amino acid substitution and its reported clinical significance, but they do not directly measure how the variant affects protein function or cardiac muscle contraction. Although ClinVar classifies the variant as likely pathogenic or pathogenic for the listed conditions, these classifications alone do not establish the exact molecular mechanism responsible for the effect.

### Possible Validation Experiment

A possible validation experiment would compare the functional effects of normal MYL2 with the MYL2 variant containing the p.Gly162Glu substitution. Both versions could be evaluated under the same experimental conditions using an appropriate cardiac muscle model or myosin functional assay. Researchers could measure differences in contractile performance or relevant myosin-related activity. Appropriate controls and repeated measurements would help determine whether the substitution produces a measurable functional change.

## g. References and Database Sources

### database links
- NCBI Gene: https://www.ncbi.nlm.nih.gov/gene/4633?utm_source
- NCBI Nucleotide (RefSeq NM_): https://www.ncbi.nlm.nih.gov/nuccore/NM_000432.4?utm_source
- NCBI ClinVar: https://www.ncbi.nlm.nih.gov/clinvar/variation/43479/

### accession versions: NM_000432.4
### access dates: October 27, 2026
### citations 
- https://www.ncbi.nlm.nih.gov/gene/4633?utm_source
- https://www.ncbi.nlm.nih.gov/nuccore/NM_000432.4?utm_source
- https://www.ncbi.nlm.nih.gov/clinvar/variation/43479/
