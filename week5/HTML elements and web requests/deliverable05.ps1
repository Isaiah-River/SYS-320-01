﻿clear
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.8/ToBeScraped.html

# Get outer text of every element with the tag h2
$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagname("div") | where { `
$_.getAttributeNode("class").Value -ilike "div-1"} | select innerText
$divs1