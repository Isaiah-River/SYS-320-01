clear
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.8/ToBeScraped.html

# Display only URL and its text
$scraped_page.Links | select outerText, href