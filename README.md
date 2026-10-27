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

The following files contain the outputs of the MYL2 analysis:

| File | Description |
|---|---|
| `MYL2_summary.txt` | Summary of the MYL2 gene information |
| `protein_accession.txt` | Reference protein accession information |
| `amino_acid_composition.csv` | Amino-acid composition counts |


## d. Figures
- 01_amino_acid_composition.png
<img width="2400" height="1500" alt="1055" src="https://github.com/user-attachments/assets/8b00b004-05da-484f-89d5-5a31027d6a8e" />

- 02_variant_position.png
<img width="2400" height="750" alt="1058" src="https://github.com/user-attachments/assets/0c040b8e-e934-4257-b2a9-19ef639e3ed9" />

## e. Variant Interpretation

## f. Limitations

## f. Proposed Validation Experiment

[Your proposed functional experiment.]

## g. References and Database Sources
### database links

### accession versions: 
### access dates: 
### citations 
- NCBI Gene: https://www.ncbi.nlm.nih.gov/gene/
- NCBI Protein: https://www.ncbi.nlm.nih.gov/protein/
- NCBI Nucleotide (RefSeq NM_): https://www.ncbi.nlm.nih.gov/nuccore/
- NCBI ClinVar: https://www.ncbi.nlm.nih.gov/clinvar/
