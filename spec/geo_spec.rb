require 'spec_helper'

RSpec.describe Geo do
  describe 'geo' do
    it 'returns geo info' do
      class HttpTest
        def get(_url)
          File.open('spec/fixtures/files/geo.txt').read
        end
      end
      expected = JSON.parse(File.open('spec/fixtures/files/geo.txt').read, symbolize_names: true)
      info = Geo::Geo.new(HttpTest.new).geo_info_by_ip('134.234.3.2')
      is_asserted_by { info == expected }
    end
  end
end
