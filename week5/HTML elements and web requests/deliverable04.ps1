clear
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.8/ToBeScraped.html

# Get outer text of every element with the tag h2
$h2s = $scraped_page.ParsedHtml.body.getElements.tagName("h2")
$h2s