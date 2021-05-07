# background
A friend of mine spoke to me about convert mets template to tei.

# things I used
Source files come from my friend. I believe they were created by escriptorium. XSL file is based on my XSL file [xmlpage_to_tei](https://github.com/inoblivionem/xslt-playground/blob/main/xmlpage_to_tei/xmlpage_to_tei.xsl).

# equivalences
My friend asked me to put all the `pc:TextRegion` in an element `tei:facsimile`, and to collect all the `pc:TextLine` in `tei:l`.
## for the metadata
* the name of the file in `tei:title`
* `mets:metsHdr/mets:agent/mets:name` in `tei:author`
## for the facsimile
I used this structure for each file mentionned in `mets:fileSec/mets:fileGrp/mets:file` :
```
<facsimile>
    <surfaceGrp>
    <surface  @xml:id="">
        <graphic @url="" @width="" @height="">
        <zone @xml:id="" @points="">
            <zone @xml:id="" @points=""/>
        </zone>
    </surface>
    <surfaceGrp>
</facsimile>
```
Each `mets:file` corresponds to a `tei:surface`.
* `tei:graphic` contains informations about the image that are in `pc:Page`
* `tei:zone` stands for each `pc:TextRegion`
* if `pc:TextRegion` contains one or several `pc:TextLine`, `tei:zone` are created in the `tei:zone` that already exist and contains informations about the `pc:TextLine`
## for the text
* each `mets:fileSec/mets:fileGrp` is a `tei:div` (their ids are the same)
* all the text is in a `tei:p`
* each `mets:file` is symbolized by a `tei:pb`. Their `@source` match with `tei:surface`'s ids generated before
* each `pc:TextLine`'s id from each document mentionned in `mets:file` is a `tei:lb` with a matching ref with `tei:zone`'s ids in `tei:facsimile`. The text `pc:TextLine//pc:Unicode` of each line is pasted just after the `tei:lb`. Their `@source` match with `tei:zone`'s ids generated before.
