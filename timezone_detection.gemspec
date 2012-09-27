# -*- encoding: utf-8 -*-
require File.expand_path('../lib/timezone_detection/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Boris Babusenko"]
  gem.email         = ["boris.bbk@gmail.com"]
  gem.homepage      = "https://github.com/Bor1s/timezone-detection"
  gem.summary       = %q{"Detects timezone by IP address."}
  gem.description   = "Visit #{gem.homepage} for more information."

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "timezone_detection"
  gem.require_paths = ["lib"]
  gem.version       = TimezoneDetection::VERSION
	
	gem.add_development_dependency "rspec"
	gem.add_development_dependency "rails"
	gem.add_development_dependency "sqlite3"
end
