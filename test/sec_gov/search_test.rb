
require 'test_helper'

class SecGov::SearchTest < MiniTest::Unit::TestCase

  def test_scraper
    s = SecGov::Search.new('brkb')
    assert_equal "http://www.sec.gov/cgi-bin/browse-edgar?CIK=brkb&Find=Search&owner=exclude&action=getcompany&type=10-", s.url
    assert_equal HTTParty::Response, s.page.class
    assert_equal String, s.body.class
    assert_equal Nokogiri::HTML::Document, s.noko.class
  end
end

