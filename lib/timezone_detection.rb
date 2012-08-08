require "timezone_detection/engine"
require "timezone_detection/ip_convertion"
require "timezone_detection/ip_info_db"
require "timezone_detection/application_controller_extension"

module TimezoneDetection

  mattr_accessor :api_key

  def self.config
    yield self
  end
	
end
