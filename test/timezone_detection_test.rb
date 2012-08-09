require_relative 'test_helper'

class TimezoneDetectionTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, TimezoneDetection
  end

  test "config api_key presence" do
    key = "10d1bb75dbefa046219723f1046019122f0d4fe56ec4f7ffe13f1f6d7893fb2b"
    assert_equal key, TimezoneDetection.api_key #Set in test_helper
  end

  test "ip convertion" do
    fake_ip = "80.70.60.50"
    test_obj = Class.send(:include, TimezoneDetection::IpConvertion).new
    assert_equal 842810960, test_obj.ip2long(fake_ip)
    assert_equal fake_ip, test_obj.long2ip(842810960)
  end

  test "timezone lookup by IP" do
    ip = "78.137.57.74"
    ip_info = TimezoneDetection::IpInfoDB.new
    assert_equal 3, ip_info.get_timezone_offset(ip)
  end

	test "timezone lookup by local IP" do
    ip = "127.0.0.1"
    ip_info = TimezoneDetection::IpInfoDB.new
    assert_equal Time.new.utc_offset / 60 / 60, ip_info.get_timezone_offset(ip)
  end

  test "ip_timezone record creation" do
    ip = "78.137.57.74"
    TimezoneDetection::IpTimezone.destroy_all
    TimezoneDetection::IpTimezone.create(ip: ip, utc_offset: 3)
    assert_equal 1, TimezoneDetection::IpTimezone.count
  end

  test "ip_timezone record should not be created (same already exists)" do
    ip = "78.137.57.74"
    TimezoneDetection::IpTimezone.create(ip: ip, utc_offset: 3)
    TimezoneDetection::IpTimezone.create(ip: ip, utc_offset: 3)
    assert_equal 1, TimezoneDetection::IpTimezone.count
  end

end
