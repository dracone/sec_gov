require 'test_helper'

class SecGovTest < MiniTest::Unit::TestCase

  def test_dependencies
    assert ::HTTParty
    assert ::Nokogiri
  end
end

