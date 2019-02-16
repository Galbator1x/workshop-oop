require 'spec_helper'

RSpec.describe Geo do
  before do
    stub_request(:get, 'http://ip-api.com/json/134.234.3.2')
      .to_return(
        body: '{"as":"AS1586 DoD Network Information Center","city":"Sierra Vista","country":"United States","countryCode":"US","isp":"DoD Network Information Center","lat":31.5552,"lon":-110.35,"org":"USAISC","query":"134.234.3.2","region":"AZ","regionName":"Arizona","status":"success","timezone":"America/Phoenix","zip":"85613"}',
      )
  end

  describe 'geo' do
    it 'returns geo info' do
      expected = 'country: United States, city: Sierra Vista, zip: 85613, timezone: America/Phoenix'
      info = Geo::Geo.geo_info_by_ip('134.234.3.2')
      is_asserted_by { Geo::Geo.pretty_geo_info(info) == expected }
      info = Geo::Geo.geo_info_by_ip('134.234.3.2')
      puts info[:city]
      puts Geo::Geo.pretty_geo_info(info)
    end
  end
end
