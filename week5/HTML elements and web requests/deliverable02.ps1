clear
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.8/ToBeScraped.html

# Get the links as HTML element
$scraped_page.Links