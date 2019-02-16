require 'thor'

module Geo
  class CLI < Thor
    desc 'get_geo IP', 'returns geo info by given IP, or your current IP'
    def get_geo(ip = nil)
      info = Geo.new.geo_info_by_ip(ip)
      puts "country: #{info[:country]}, city: #{info[:city]}, zip: #{info[:zip]}, timezone: #{info[:timezone]}"
    end
  end
end
