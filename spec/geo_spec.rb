require 'spec_helper'

RSpec.describe Geo do
  describe 'geo' do
    it 'returns geo info' do
      class HttpTest
        def get(_url)
          "{\"as\":\"AS1586 DoD Network Information Center\",\"city\":\"Sierra Vista\",\"country\":\"United States\",\"countryCode\":\"US\",\"isp\":\"DoD Network Information Center\",\"lat\":31.5552,\"lon\":-110.35,\"org\":\"USAISC\",\"query\":\"134.234.3.2\",\"region\":\"AZ\",\"regionName\":\"Arizona\",\"status\":\"success\",\"timezone\":\"America/Phoenix\",\"zip\":\"85613\"}"
        end
      end
      expected = { :as=>"AS1586 DoD Network Information Center", :city=>"Sierra Vista", :country=>"United States", :countryCode=>"US", :isp=>"DoD Network Information Center", :lat=>31.5552, :lon=>-110.35, :org=>"USAISC", :query=>"134.234.3.2", :region=>"AZ", :regionName=>"Arizona", :status=>"success", :timezone=>"America/Phoenix", :zip=>"85613" }
      info = Geo::Geo.new(HttpTest.new).geo_info_by_ip('134.234.3.2')
      is_asserted_by { info == expected }
    end
  end
end
