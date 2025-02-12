# [2025-kmerseek-yc-demo](https://github.com/seanome/2025-kmerseek-yc-demo)
Kmerseek demo example for YC S25 Application

## Installation instructions

Create a [conda](https://docs.conda.io/en/latest/) environment:

```
conda env create --file environment.yml
```

Then install the kmerseek branch:

```
pip install git+https://github.com/seanome/kmerseek.git@olgabot/initial-demo
```


## Running instructions


### Create the searchable index

Create an index of a subset of human cell death genes with `make index` or:

```
kmerseek \
    index \
    --ksize 16 \
    bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz
```

### Run the search

Now search for the marine gene in human genes with `make search` or

```
kmerseek \
    search \
    --ksize 16 \
    ced9.fasta \
    bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz
```

If you like, also run everything with `make all`.

### Example output

The `kmerseek_search.csv` shows example output, which looks like this:

| query_name | query_md5 | match_name | containment | intersect_hashes | ksize | scaled | moltype | match_md5 | jaccard | max_containment | average_abund | median_abund | std_abund | query_containment_ani | match_containment_ani | average_containment_ani | max_containment_ani | n_weighted_found | total_weighted_hashes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp|Q9BXH1|BBC3_HUMAN Bcl-2-binding component 3, isoforms 1/2 OS=Homo sapiens OX=9606 GN=BBC3 PE=1 SV=1 | 0.04081632653 | 2 | 48 | 5 | hp | 1d49aa1205276b9ba0176c6680cacd6d | 0.0243902439 | 0.05714285714 | 1 | 1 | 0 | 0.935532846 | 0.9421138187 | 0.9388233324 | 0.9421138187 | 2 | 35 |
| sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp|Q12982|BNIP2_HUMAN BCL2/adenovirus E1B 19 kDa protein-interacting protein 2 OS=Homo sapiens OX=9606 GN=BNIP2 PE=1 SV=1 | 0.04081632653 | 2 | 48 | 5 | hp | 7bbc6e2ea3a472034fc31321943032ee | 0.02040816327 | 0.04081632653 | 1 | 1 | 0 | 0.935532846 | 0.9347534561 | 0.935143151 | 0.935532846 | 2 | 51 |
| sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp|Q13625|ASPP2_HUMAN Apoptosis-stimulating of p53 protein 2 OS=Homo sapiens OX=9606 GN=TP53BP2 PE=1 SV=2 | 0.02040816327 | 1 | 48 | 5 | hp | 35da5dcf3561c6c0b0aaa34a118eabef | 0.003610108303 | 0.02040816327 | 1 | 1 | 0 | 0.9221202974 | 0.8929697781 | 0.9075450378 | 0.9221202974 | 1 | 230 |
| sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp|Q9UK96|FBX10_HUMAN F-box only protein 10 OS=Homo sapiens OX=9606 GN=FBXO10 PE=1 SV=3 | 0.0612244898 | 3 | 48 | 5 | hp | 97f5f83c6214d6792113785b96747383 | 0.01435406699 | 0.0612244898 | 1 | 1 | 0 | 0.9434689411 | 0.9201376139 | 0.9318032775 | 0.9434689411 | 3 | 164 |
| sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp|Q16611|BAK_HUMAN Bcl-2 homologous antagonist/killer OS=Homo sapiens OX=9606 GN=BAK1 PE=1 SV=1 | 0.02040816327 | 1 | 48 | 5 | hp | 1f59cdb10b02a7c6baff18b034518599 | 0.01111111111 | 0.02380952381 | 1 | 1 | 0 | 0.9221202974 | 0.9250864216 | 0.9236033595 | 0.9250864216 | 1 | 42 |