### -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  
### openlearn-importer.r
### -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  
### 
### HISTORY
###
###   2012-06-01 created.
###

fetchOpenlearnUnit <- function ( url="", unit="" ) {

	if (url=="") {
		stop("No url specified!")
	}
	
	if (unit=="") {
		unit = gsub("^.*/([A-Za-z0-9\\_]*)\\_rss\\.xml","\\1",url)
	}
	
	rss = xmlTreeParse(url)
	
	textnodes = getNodeSet(rss$doc$children$rss, "//item/title | //item/description")
	
	texts = NULL
	for (i in 1:length(textnodes)) {
		tag = xmlName(textnodes[i][[1]])
		if (tag == "title") {
			texts = c(texts, xmlValue(textnodes[i][[1]]))
		} else {
			texts[length(texts)] = paste(texts[length(texts)], xmlValue(textnodes[i][[1]]))
		} # if
	} # for
	
	# remove html tags
	texts = gsub("<(.|\n)*?>"," ",texts)
	
	# html2text
	#texts = htmlParse(texts, asText=TRUE )	
	
	# clean up leftovers
	texts = gsub("&copy;"," ",texts)
	texts = gsub("&#x[A-Za-z0-9]*;"," ",texts)
	texts = gsub("\n"," ",texts)
	
	# copyright statement removal
	
	texts = gsub("(Original Copyright   2004 The Open University\\. Now made available within the Creative Commons framework under the CC Attribution   Non\\-commercial licence \\(see http://creativecommons.org/licenses/by-nc-sa/2.0/uk/\\))."," ",texts)
	texts = gsub("(Except for third party materials and otherwise stated \\(see  terms and conditions \\), this content is made available under a  Creative Commons Attribution\\-NonCommercial\\-ShareAlike 2\\.0 Licence   )"," ", texts)
	texts = gsub("(Original Copyright   [0-9]* The Open University\\. Now made available within the Creative Commons framework under the CC Attribution   Non\\-commercial licence \\(see  )", " ", texts)
	texts = gsub("(Copyright   [0-9]* The Open University)"," ", texts)
	# link removal
	texts = gsub("((http|ftp|https)://)([^:/^[:blank:]]+)(:([0-9]+))?(/.*)", " ", texts)
	
	# quotes removel
	texts = gsub("\\\""," ", texts)
	
	# create units of text
	
	texts
	
}
