require 'geo/version'
require 'httparty'
require 'json'

module Geo
  class Geo
    GEO_API_URL = 'http://ip-api.com/json'.freeze

    attr_reader :http_client

    def initialize(http_client = HttpClient.new)
      @http_client = http_client
    end

    def geo_info_by_ip(ip)
      html = http_client.get("#{GEO_API_URL}/#{ip || ''}")
      JSON.parse(html, symbolize_names: true)
    end
  end
end

class HttpClient
  def get(url)
    HTTParty.get(url).body
  end
end
