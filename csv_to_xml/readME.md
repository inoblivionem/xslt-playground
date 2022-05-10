# background
I did that tokenizer while working around iramuteq projets with a PhD candidate friend of mine. I wanted to try csv -> iramuteq corpus transformation.

# things I used
I used [Haley's answer on SoF](https://stackoverflow.com/a/29295839). I modified his suggestion to make it more practical. The CSV file gathers informations about 2022 French presidential election and is [available on the Conseil Constitutionnel's website](https://presidentielle2022.conseil-constitutionnel.fr/les-parrainages/tous-les-parrainages-valides.html).

# encoding
CSV file has to :
* have column ids without special characters or whitespaces.
* be encoded in utf-8 or iso-8859-1 (idk if it'll work otherwise).
* have commas as separator (for semicolons => change from , to ; in the tokenize function of the xsl file).
