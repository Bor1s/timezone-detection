module TimezoneDetection
	module ClassMethods
		def set_timezone
			ip_timezone = IpTimezone.find_ip(request.remote_ip).first
			unless ip_timezone.present?
				ip_info = IpInfoDB.new
				offset = ip_info.get_timezone_offset(request.remote_ip)
				ip_timezone = IpTimezone.create(ip: request.remote_ip, utc_offset: offset)
			end
			Time.zone = ActiveSupport::TimeZone[ip_timezone.utc_offset]
		end
	end
end
