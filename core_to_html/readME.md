# background
I did that xslt while working around [coreBuilder](https://github.com/dylan275/coreBuilder). This was our first draw of html output from the core.

# things I used
## functions
I used [exslt functions](http://exslt.org/func/) to replace the `xsl:document` function.
## tokenized documents
I made these example files and tokenized them using my [xslt1.0 tokenizer](https://github.com/inoblivionem/xslt-playground/tree/main/tokenizer_xslt1).
## core
The core document comes from our [coreBuilder](https://github.com/dylan275/coreBuilder) instance. It shows types of variations.

# processors and versioning
I know it works with PHP's XSLT processor and my [homemade processor](https://github.com/inoblivionem/xslt-playground/tree/main/xsltproc) based on [Sagehill Enterprises' advices](http://sagehill.net/docbookxsl/InstallingAProcessor.html). I did not try with other processors, so feel free to give feedback about this.

# issues
I failed the footnotes' numerotation.
