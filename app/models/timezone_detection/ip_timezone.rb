module TimezoneDetection

  class IpTimezone < ActiveRecord::Base
    extend TimezoneDetection::IpConvertion

    attr_accessor :ip
    attr_accessible :ip, :utc_offset

    before_save :cancel_if_current_ip_already_exists

		def self.find_ip(ip)
      IpTimezone.where(ip_in_longint: IpTimezone.ip2long(ip))
		end

    private

    def cancel_if_current_ip_already_exists
      self.ip_in_longint = IpTimezone.ip2long(ip)
      !IpTimezone.where(ip_in_longint: self.ip_in_longint).exists? #Stops saving if return false
    end
  end

end
