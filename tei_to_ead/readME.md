# background
I had to convert TEI metadata to ead metadata.

# things I used
## ead 2002
EAD or Encoded Archival Description is a standard use to describe archival documents. For example, it's used by the National Library of France (BnF). You can have a look on the [EAD site](https://www.loc.gov/ead/) for more informations.
<br/>The examples I used to create this were based on EAD 2002 so am I.
## xml file
I encoded the xml file and it may not be perfect, but feel free to reuse it for your experiments.

# equivalences
I used this structure :
```
<ead>
   <eadheader>
      <eadid/>
      <filedesc>
         <titlestmt>
            <titleproper/>
            <author/>
         </titlestmt>
         <publicationstmt>
            <publisher/>
            <date/>
            <address/>
         </publicationstmt>
      </filedesc>
      <profiledesc>
         <creation>
            <date/>
         </creation>
      </profiledesc>
   </eadheader>
   <archdesc @level="">
      <did>
         <repository/>
         <unitid/>
         <unittitl/>
         <unitdat/>
         <physdesc/>
         <abstract/>
         <langmaterial>
            <language/>
         </langmaterial>
      </did>
      <dsc>
         <c01 @level="">
            <did>
               <unitid/>
               <unittitle/>
            </did>
            <c02 @level="">
               <did>
                  <unitid/>
                  <unittitle/>
               </did>
            </c02>
         </c01>
      </dsc>
   </archdesc>
</ead>
```

# issues
I will make an EAD 2003 version.