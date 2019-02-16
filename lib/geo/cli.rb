require 'thor'

module Geo
  class CLI < Thor
    desc 'get_geo IP', 'returns geo info by given IP, or your current IP'
    def get_geo(ip = nil)
      info = Geo.geo_info_by_ip(ip)
      puts Geo.pretty_geo_info(info)
    end
  end
end
