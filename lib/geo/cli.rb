require 'thor'

module Geo
  class CLI < Thor
    desc 'get_geo IP', 'returns geo info by given IP, or your current IP'
    def get_geo(ip = nil)
      puts Geo.geo_info_by_ip(ip)
    end
  end
end
