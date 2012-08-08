module TimezoneDetection

  class IpTimezone < ActiveRecord::Base
    include TimezoneDetection::IpConvertion

    attr_accessor :ip
    attr_accessible :ip, :utc_offset

    before_save :cancel_if_current_ip_already_exists

    private

    def cancel_if_current_ip_already_exists
      self.ip_in_longint = ip2long(ip)
      !IpTimezone.where(ip_in_longint: self.ip_in_longint).exists? #Stops saving if return false
    end
  end

end
