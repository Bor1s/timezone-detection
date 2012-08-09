$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "timezone_detection/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "timezone_detection"
  s.version     = TimezoneDetection::VERSION
  s.authors     = ["Boris Babusenko"]
  s.email       = ["boris.bbk@gmail.com"]
  s.homepage    = "https://github.com/Bor1s/timezone-detection"
  s.summary     = "Gem for detecting users timezone by IP address."
  s.description = "Visit #{s.homepage} for more information."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
