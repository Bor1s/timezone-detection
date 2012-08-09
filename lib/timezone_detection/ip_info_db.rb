require 'net/http'
require 'uri'

module TimezoneDetection

  class IpInfoDB
    attr_accessor :api_key

    module STATUS_CODES
      SUCCESS = "OK"
      FAIL = "ERROR"
    end

    def initialize
      @api_key = TimezoneDetection.api_key
    end

    def get_timezone_offset(ip)
      begin
				raise if ip == "127.0.0.1"
        response = Net::HTTP.get(URI("http://api.ipinfodb.com/v3/ip-city/?key=#{api_key}&ip=#{ip}&format=json"))
        json = ActiveSupport::JSON.decode(response)
        if json["statusCode"] == STATUS_CODES::SUCCESS
          extract_timezone_offset(json["timeZone"])
        else
          json["statusMessage"]
        end
      rescue => e
        #TODO make output to Rails logger
        puts e.message
        "Request to http://www.ipinfodb.com/ failed. Please try later!"
        Time.new.utc_offset / 60 / 60
      end
    end

    private

    def extract_timezone_offset(string)
      pattern = /\A((\+|\-)\d\d)/
      string.match pattern
      $1.to_i
    end
  end

end
