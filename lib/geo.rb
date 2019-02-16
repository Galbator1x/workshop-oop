require 'geo/version'
require 'httparty'
require 'json'

module Geo
  class Geo
    GEO_API_URL = 'http://ip-api.com/json'.freeze

    def self.geo_info_by_ip(ip)
      html = HTTParty.get("#{GEO_API_URL}/#{ip || ''}")
      info = JSON.parse(html.body, symbolize_names: true)
      "country: #{info[:country]}, city: #{info[:city]}, zip: #{info[:zip]}, timezone: #{info[:timezone]}"
    end
  end
end
