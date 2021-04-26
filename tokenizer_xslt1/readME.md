# background
I did that tokenizer while working around [coreBuilder](https://github.com/dylan275/coreBuilder). We needed a xslt1.0 tokenizer for our tests and vizualisations.

# things I used
I used [exslt functions](http://exslt.org/func/) to replace the `xsl:document` function and to tokenize with the `tokenize` function.

# processors and versioning
I know it works with the PHP's XSLT processor and my [homemade processor](https://github.com/inoblivionem/xslt-playground/tree/main/xsltproc) based on [Sagehill Enterprises' advices](http://sagehill.net/docbookxsl/InstallingAProcessor.html). I did not try with other processors, so feel free to give feedback about this.

# issues
1. I can"t put namespace in the root element of the tokenized file
2. You'll have to adjust by hand the xsl file according to your number of `div` elements in your arborescence, since for the moment my tokenizer can't handle a `div` in a `div`. It works for something like `text/body/div/p` with as many `p` as you want in a `div` and as many `div` as you want in your `body`.