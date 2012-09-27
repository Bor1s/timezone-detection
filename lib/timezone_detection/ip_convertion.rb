module TimezoneDetection
  module IpConvertion
    def ip2long(ip)
      long = 0
      ip.split(/\./).each_with_index do |b, i|
        long += b.to_i << ( 8*i )
      end
      long
    end

    def long2ip(long)
      ip = []
      4.times do |i|
        ip.push(long.to_i & 255)
        long = long.to_i >> 8
      end
      ip.join(".")
    end
  end
end
