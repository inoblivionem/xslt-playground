# background
A friend of mine spoke to me about convert xmlpage to tei, and I tried it because I figured it could be funny.

# things I used
Nothing really fancy. Be careful, the source file I used is found malformed by oXygen. This is [P1040234.xml](https://github.com/FloChiff/DAHNProject/blob/master/Project%20development/Training/Ground%20truth/data/page/P1040234.xml) by [FloChiff](https://github.com/FloChiff). I believe this file was created by escriptorium.

# equivalences
## for the metadata
* the name of the file in `tei:title`
* `pc:Creator` in `tei:author`
* `pc:Created` and `pc:LastChange` each one in `tei:revisionDesc/tei:change`
## for the file's body
I used a structure I studied during my TEI courses which basically is :
```
<sourceDoc>
    <surfaceGrp @xml:id=""/>
    <surface>
        <graphic @uri="" @width="" @height=""/>
            <zone @xml:id="" @points="">
            <line/>
            </zone>
        </surface>
    </surfaceGrp>
</sourceDoc>
```
* `sourceDoc` contains all the document
* `surfaceGrp/@xml:id` identifies the text region ; informations come from `pc:TextRegion/@id` 
* `surface` corresponds to one page
* `graphic` contains informations about the image file that were in `pc:Page`
* for each element `pc:TextLine` we create an equivalent element `tei:zone` which contains :
    * `tei:zone/@xml:id` : the identifier of the zone, from `pc:TextLine/@id`
    * `tei:zone/@points` : coordinates of zone from `pc:TextLine/pc:Coords`
    * `tei:zone/tei:line` : transcription's container from `pc:TextLine/pc:TextEquiv/pc:Unicode`

# issues
`pc:PcGts/pc:Page/pc:TextRegion/pc:TextLine/pc:Baseline`'s missing, I didn't know where to put it.