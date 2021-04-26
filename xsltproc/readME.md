# background
We needed a windows xslt1.0 processor for working on [coreBuilder](https://github.com/dylan275/coreBuilder).

# things I used
That's pretty simple but the documentation is old and hidden and the libraries are quite hard to find.
## Sagehill's instructions
I basically followed [Sagehill Enterprises' advices](http://sagehill.net/docbookxsl/InstallingAProcessor.html).
## libraries
* `iconv.dll` : converts
* `libexslt.dll` : implements [exslt functions](http://exslt.org/func/)
* `libxml2.dll` : parses XML
* `libxslt.dll` : implements xslt 1.0
* `zlib1.dll` : compresses data

# get ready
1. Put this folder somewhere on your computer
2. Add this folder to your path (Advanced system settings > Environment variables > Path > New)
3. Check it by type xsltproc in a command prompt

# utilisation
It's simpler to open a command prompt in the folder that contains your xsl and your xml. Just launch :
```
xsltproc xsl xml
```
where xsl is the name of your xsl file and xml is the name of your xml file. (don't forget extensions)