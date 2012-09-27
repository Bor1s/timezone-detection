require "spec_helper"
require "timezone_detection"

describe TimezoneDetection do
	before :all do
		TimezoneDetection.config do |obj|
			obj.api_key = "10d1bb75dbefa046219723f1046019122f0d4fe56ec4f7ffe13f1f6d7893fb2b"
		end
	end

	it { should be_a_kind_of(Module) }

	it "should have an api key" do
		TimezoneDetection.api_key.should eq "10d1bb75dbefa046219723f1046019122f0d4fe56ec4f7ffe13f1f6d7893fb2b"
	end

	context "Convertation" do
		let(:fake_ip) { "80.70.60.50" }
		let(:fake_ip_longint ) { 842810960 }
		let(:test_obj) { Class.send(:include, TimezoneDetection::IpConvertion).new }

		specify { fake_ip_longint.should eq test_obj.ip2long(fake_ip) }
		specify { fake_ip.should eq test_obj.long2ip(fake_ip_longint) }
	end

	context "Timezone" do
		let(:expected_timezone_offset) { 3 }
		let(:ip) { "78.137.57.74" }
		let(:local_ip) { "127.0.0.1" }
		let(:ip_info) { TimezoneDetection::IpInfoDB.new }

		specify { ip_info.get_timezone_offset(ip).should eq 3 }
		specify { ip_info.get_timezone_offset(local_ip).should eq Time.new.utc_offset / 60 / 60 }
	end

	context "IpTimezone table" do
		let(:ip) { "78.137.57.74" }

		it "should have one record "do
			TimezoneDetection::IpTimezone.destroy_all
			expect { TimezoneDetection::IpTimezone.create(ip: ip, utc_offset: 3) }.to change(TimezoneDetection::IpTimezone, :count).by 1
		end
		
		it "should not create the duplicated record "do
			TimezoneDetection::IpTimezone.destroy_all
			expect { 2.times { TimezoneDetection::IpTimezone.create(ip: ip, utc_offset: 3) } }.to change(TimezoneDetection::IpTimezone, :count).by 1
		end
	end

end
