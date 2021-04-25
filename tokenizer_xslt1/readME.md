# background
I did that tokenizer while working around [coreBuilder](https://github.com/dylan275/coreBuilder). We needed a xslt1.0 tokenizer for our tests and vizualisations.

# things I used
I used [exslt functions](http://exslt.org/func/) to replace the `xsl:document` function and to tokenize with the `tokenize` function.

# processors and versioning
I know it works with the PHP's XSLT processor and my homemade processor based on [Sagehill Enterprises' advices](http://sagehill.net/docbookxsl/InstallingAProcessor.html). I did not try with other processors, so feel free to give feedback about this.