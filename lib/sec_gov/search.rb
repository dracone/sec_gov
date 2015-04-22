module SecGov
  class Search < Struct.new(:symbol)
    include Scraper

    URL = "http://www.sec.gov/cgi-bin/browse-edgar?CIK=%s&Find=Search&owner=exclude&action=getcompany&type=10-"
  end
end

