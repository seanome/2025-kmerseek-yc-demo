# 2025-yc-demo
Kmerseek demo example for YC S25 Application

## Installation instructions

Create a [conda](https://docs.conda.io/en/latest/) environment:

```
conda env create --file environment.yml
```

Then install the kmerseek branch:

```
pip install git+https://github.com/seanome/kmerseek/tree/olgabot/initial-demo
```


## Running instructions

### Create the searchable index

Create an index of all well-annotated hu

```
kmerseek index uniprotkb_taxonomy_name_Human_AND_revie_2025_02_06.fasta.gz
```

### Run the search:

Now search for the marine gene in human genes:

```
kmerseek search bhf.fa uniprotkb_taxonomy_name_Human_AND_revie_2025_02_06.fasta.gz
```