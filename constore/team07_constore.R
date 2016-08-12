rm(list=ls(all=TRUE))
library(XML)
library(bitops)
library(RCurl)
library(httr)

orgURL = 'http://www.ibon.com.tw/retail_inquiry.aspx#gsc.tab=0'

#orgURL = 'https://www.ptt.cc/bbs/StupidClown/index.html'

startPage = 1
endPage = 1
alldata = data.frame()
for( i in startPage:endPage)
{
  pttURL <- paste(orgURL, i, sep='')
  urlExists = url.exists(pttURL)
  
  if(urlExists)
  {
    html = getURL(pttURL, ssl.verifypeer = FALSE)
    xml = htmlParse(html, encoding ='utf-8')
    
    write(html, "test.html")
    
    id = xpathSApply(xml, "//td//a", xmlValue)
    name = xpathSApply(xml,"//tr/td[2]/text()",xmlValue)
    add= xpathSApply(xml,"//tr/td[3]/text()",xmlValue)
    
    #tempdata = data.frame(id, name, add)
  }
  #alldata = rbind(alldata, tempdata)
}

#write.csv(alldata,"alldata_constore.csv")