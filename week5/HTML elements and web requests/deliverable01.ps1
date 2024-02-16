clear
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.8/ToBeScraped.html

# Get a count of the links on the page
$scraped_page.Links.Count