require 'open-uri'

module Scraper

  def noko
    @noko ||= Nokogiri::HTML(body)
  end

  def valid?
    page &&
    (200..299).cover?(page.code) &&
    true
  rescue HTTParty::RedirectionTooDeep
    false
  end

  def url
    self.class.const_get(:URL) % symbol
  end

  def body
    @body ||= page.body
  end

  def http?
    url.match(/^http/)
  end

  def ftp?
    url.match(/^ftp/)
  end

  def page
    @page ||= if http?
      HTTParty.get(url, :query => get_params, :no_follow => true)
    elsif ftp?
      open(url).read
    end
  end

  def get_params
    {}
  end
end

