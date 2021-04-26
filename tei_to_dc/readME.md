# background
I had to convert TEI metadata to dublin core metadata.

# things I used
## dublincore
Dublin Core is a bunch of properties use to describe documents. You can have a look on the [DCMI](https://www.dublincore.org/specifications/dublin-core/dces/) for more informations.
## xml file
I encoded the xml file and it may not be perfect, but feel free to reuse it for your experiments.

# equivalences
* `tei:fileDesc/tei:titleStmt/tei:title` for `dc:title`
* `tei:TEI/@xml:id` for `dc:identifier`
* `tei:fileDesc/tei:titleStmt/tei:author` for `dc:contributer`
* `tei:fileDesc/tei:publicationStmt/tei:date/@when` for `dc:date`
* `tei:fileDesc/tei:publicationStmt/tei:publisher` for `dc:publisher`
* `tei:profileDesc/tei:textClass/tei:keywords/tei:term` encoded with an attribute `@scheme='dc'` for the element `tei:keywords` for `dc:subject`
* `tei:profileDesc/tei:abstract` for `dc:description`
* `tei:profileDesc/tei:langUsage/tei:language` for `dc:language`
* `tei:fileDesc/tei:publicationStmt/tei:availability/@status` for `dc:rights`
* `tei:fileDesc/tei:sourceDesc/tei:p` and `tei:fileDesc/tei:sourceDesc/tei:bibl` for `dc:source`

# issues
That's a quite old xslt, it surely deserves an update.