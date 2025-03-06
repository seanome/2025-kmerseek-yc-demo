# [2025-kmerseek-yc-demo](https://github.com/seanome/2025-kmerseek-yc-demo)
Kmerseek demo example for YC S25 Application

## Installation instructions

Create a [conda](https://docs.conda.io/en/latest/) environment:

```
conda create -n 2025-kmerseek-yc-demo -c conda-forge -c bioconda --yes polars sourmash click pandas sourmash_plugin_branchwater
```

Activate the environment:

```
conda activate 2025-kmerseek-yc-demo 
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

<details><summary>`kmerseek index` output</summary>

```
kmerseek \
                index \
                --ksize 16 \
                bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz
Loaded 1 rows in total (0 genome and 1 protein files)
Building 1 sketch types:
    hp,k=16,scaled=5,num=0,abund=true
Starting file 1/1 (100%)
Writing manifest
DONE. Processed 1 fasta files
loaded 25 signatures total, from 1 files
loaded and merged 25 signatures

merged signature has the following properties:
k=16 molecule=hp num=0 scaled=5 seed=42
total hashes in merged signature: 1603

now processing sequence files for matches!
opening sequence file 'bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz'
DONE.
searched 25 sequences from 1 files, containing a total of 9.3 kbp.
matched and saved a total of 25 sequences with 9.3 kbp.
matched and saved a total of 1760 k-mers.
found 1603 distinct matching hashes (100.0%)
indexing all sketches in 'bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip'
Loading sketches from bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip.siglist
Reading analysis(s) from: 'bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip.siglist'
FAILED to load as JSON files; falling back to general recursive
Loaded 25 analysis signature(s)
Found 25 sketches total.
Indexing 25 sketches.
Using external storage - not copying sketches.
...index is done! results in 'bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip.rocksdb'
```

</details>


### Run the search

Now search for the marine gene in human genes with `make search` or

```
kmerseek \
    search \
    --ksize 16 \
    ced9.fasta \
    bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz
```

<details><summary>`kmerseek search` output</summary>

```
kmerseek \
                search \
                --ksize 16 \
                ced9.fasta \
                bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz
Loaded 1 rows in total (0 genome and 1 protein files)
Building 1 sketch types:
    hp,k=16,scaled=5,num=0,abund=true
Starting file 1/1 (100%)
Writing manifest
DONE. Processed 1 fasta files
2025-03-04 15:09:01 - kmerseek.logging - INFO - Calling get_kmers_cli on ced9.fasta.hp.k16.scaled5.sig.zip with ced9.fasta
2025-03-04 15:09:01 - kmerseek.logging - INFO - Saving matches to /var/folders/rl/81r400y52z38l8_kwn4g1xdc0000gn/T/tmp7msljbul.csv
loaded 1 signatures total, from 1 files
loaded and merged 1 signatures

merged signature has the following properties:
k=16 molecule=hp num=0 scaled=5 seed=42
total hashes in merged signature: 49

now processing sequence files for matches!
opening sequence file 'ced9.fasta'
DONE.
searched 1 sequences from 1 files, containing a total of 280 bp.
matched and saved a total of 1 sequences with 280 bp.
matched and saved a total of 49 k-mers.
found 49 distinct matching hashes (100.0%)
2025-03-04 15:09:01 - kmerseek.logging - INFO - Reading in k-mers, adding hp encoded values
2025-03-04 15:09:01 - kmerseek.logging - INFO - Found signature file bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip, skipping! Re-make with '--force'
selection scaled: Some(5)
Reading query(s) from: 'ced9.fasta.hp.k16.scaled5.sig.zip.siglist'
FAILED to load as JSON files; falling back to general recursive
Loaded 1 query signature(s)
Reading search(s) from: 'bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip.siglist'
FAILED to load as JSON files; falling back to general recursive
Loaded 25 search signature(s)
DONE. Processed 25 search sigs
2025-03-04 15:09:01 - kmerseek.logging - INFO - Found k-mer parquet bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz.hp.k16.scaled5.sig.zip.kmers.pq, skipping! Re-make with '--force'

---
Query Name: sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1
Match Name: sp|Q9UK96|FBX10_HUMAN F-box only protein 10 OS=Homo sapiens OX=9606 GN=FBXO10 PE=1 SV=3
query: MSIGESIDGKINDWEEPGIVGVVVCGRMMFSLK (59-92)
alpha: hphhpphphphpphpphhhhhhhhphphhhphp
match: PNWPNQPDVEPESWREAAGIYILYHGNPVVSGN (57-90)

---
Query Name: sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1
Match Name: sp|Q12982|BNIP2_HUMAN BCL2/adenovirus E1B 19 kDa protein-interacting protein 2 OS=Homo sapiens OX=9606 GN=BNIP2 PE=1 SV=1
query: RLDIEGFVVDYFTHRILFVYTSLFIKTRIRNN (76-108)
alpha: phphphhhhphhppphhhhhpphhhppphppp
match: SIEADILAITGPEDQPLLAVTRPFISSKFSQK (23-55)

---
Query Name: sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1
Match Name: sp|Q9BXH1|BBC3_HUMAN Bcl-2-binding component 3, isoforms 1/2 OS=Homo sapiens OX=9606 GN=BBC3 PE=1 SV=1
query: LIGLISFGGFVAAKMME (170-187)
alpha: hhhhhphhhhhhhphhp
match: APAAPTLLPAAYLCAPT (46-63)

---
Query Name: sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1
Match Name: sp|Q13625|ASPP2_HUMAN Apoptosis-stimulating of p53 protein 2 OS=Homo sapiens OX=9606 GN=TP53BP2 PE=1 SV=2
query: KVGRRKQNRRWSMIGA (241-257)
alpha: phhppppppphphhhh
match: TIIHREDEDEIEWWWA (1084-1100)

---
Query Name: sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1
Match Name: sp|Q16611|BAK_HUMAN Bcl-2 homologous antagonist/killer OS=Homo sapiens OX=9606 GN=BAK1 PE=1 SV=1
query: RKQNRRWSMIGAGVTA (245-261)
alpha: pppppphphhhhhhph
match: HQQEQEAEGVAAPADP (42-58)

match_name,query_name,query_start,query_end,query,match_start,match_end,match,encoded,length
sp|Q9UK96|FBX10_HUMAN F-box only protein 10 OS=Homo sapiens OX=9606 GN=FBXO10 PE=1 SV=3,sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1,59,92,MSIGESIDGKINDWEEPGIVGVVVCGRMMFSLK,57,90,PNWPNQPDVEPESWREAAGIYILYHGNPVVSGN,hphhpphphphpphpphhhhhhhhphphhhphp,33
sp|Q12982|BNIP2_HUMAN BCL2/adenovirus E1B 19 kDa protein-interacting protein 2 OS=Homo sapiens OX=9606 GN=BNIP2 PE=1 SV=1,sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1,76,108,RLDIEGFVVDYFTHRILFVYTSLFIKTRIRNN,23,55,SIEADILAITGPEDQPLLAVTRPFISSKFSQK,phphphhhhphhppphhhhhpphhhppphppp,32
"sp|Q9BXH1|BBC3_HUMAN Bcl-2-binding component 3, isoforms 1/2 OS=Homo sapiens OX=9606 GN=BBC3 PE=1 SV=1",sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1,170,187,LIGLISFGGFVAAKMME,46,63,APAAPTLLPAAYLCAPT,hhhhhphhhhhhhphhp,17
sp|Q13625|ASPP2_HUMAN Apoptosis-stimulating of p53 protein 2 OS=Homo sapiens OX=9606 GN=TP53BP2 PE=1 SV=2,sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1,241,257,KVGRRKQNRRWSMIGA,1084,1100,TIIHREDEDEIEWWWA,phhppppppphphhhh,16
sp|Q16611|BAK_HUMAN Bcl-2 homologous antagonist/killer OS=Homo sapiens OX=9606 GN=BAK1 PE=1 SV=1,sp|P41958|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1,245,261,RKQNRRWSMIGAGVTA,42,58,HQQEQEAEGVAAPADP,pppppphphhhhhhph,16
```

</details>


If you like, also run everything with `make all`.

### Example output

The `kmerseek_search.csv` shows example output, which looks like this:

| query_name | query_md5 | match_name | containment | intersect_hashes | ksize | scaled | moltype | match_md5 | jaccard | max_containment | average_abund | median_abund | std_abund | query_containment_ani | match_containment_ani | average_containment_ani | max_containment_ani | n_weighted_found | total_weighted_hashes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| sp\|P41958\|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp\|Q9BXH1\|BBC3_HUMAN Bcl-2-binding component 3, isoforms 1/2 OS=Homo sapiens OX=9606 GN=BBC3 PE=1 SV=1 | 0.04081632653 | 2 | 48 | 5 | hp | 1d49aa1205276b9ba0176c6680cacd6d | 0.0243902439 | 0.05714285714 | 1 | 1 | 0 | 0.935532846 | 0.9421138187 | 0.9388233324 | 0.9421138187 | 2 | 35 |
| sp\|P41958\|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp\|Q12982\|BNIP2_HUMAN BCL2/adenovirus E1B 19 kDa protein-interacting protein 2 OS=Homo sapiens OX=9606 GN=BNIP2 PE=1 SV=1 | 0.04081632653 | 2 | 48 | 5 | hp | 7bbc6e2ea3a472034fc31321943032ee | 0.02040816327 | 0.04081632653 | 1 | 1 | 0 | 0.935532846 | 0.9347534561 | 0.935143151 | 0.935532846 | 2 | 51 |
| sp\|P41958\|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp\|Q13625\|ASPP2_HUMAN Apoptosis-stimulating of p53 protein 2 OS=Homo sapiens OX=9606 GN=TP53BP2 PE=1 SV=2 | 0.02040816327 | 1 | 48 | 5 | hp | 35da5dcf3561c6c0b0aaa34a118eabef | 0.003610108303 | 0.02040816327 | 1 | 1 | 0 | 0.9221202974 | 0.8929697781 | 0.9075450378 | 0.9221202974 | 1 | 230 |
| sp\|P41958\|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp\|Q9UK96\|FBX10_HUMAN F-box only protein 10 OS=Homo sapiens OX=9606 GN=FBXO10 PE=1 SV=3 | 0.0612244898 | 3 | 48 | 5 | hp | 97f5f83c6214d6792113785b96747383 | 0.01435406699 | 0.0612244898 | 1 | 1 | 0 | 0.9434689411 | 0.9201376139 | 0.9318032775 | 0.9434689411 | 3 | 164 |
| sp\|P41958\|CED9_CAEEL Apoptosis regulator ced-9 OS=Caenorhabditis elegans OX=6239 GN=ced-9 PE=1 SV=1 | fe3714626e8180caf90f78091563aae6 | sp\|Q16611\|BAK_HUMAN Bcl-2 homologous antagonist/killer OS=Homo sapiens OX=9606 GN=BAK1 PE=1 SV=1 | 0.02040816327 | 1 | 48 | 5 | hp | 1f59cdb10b02a7c6baff18b034518599 | 0.01111111111 | 0.02380952381 | 1 | 1 | 0 | 0.9221202974 | 0.9250864216 | 0.9236033595 | 0.9250864216 | 1 | 42 |
