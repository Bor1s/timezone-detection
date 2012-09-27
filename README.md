# TimezoneDetection

This gem used for setting user's timezone based on IP.

## Installation

Add this line to your application's Gemfile:

    gem 'timezone_detection'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timezone_detection

## Usage

	$ rails generate timezone_detection:install
	$	rake db:migrate

This gem uses IpInfoDb web service to determine your timezone. API KEY required for dealing with site API, so you should register your own and set it in initializer file ( for this visit http://ipinfodb.com/ ):

For example: *config/initializers/my_own_timezone_initializer.rb*

	TimezoneDetection.config do |cnf|
		cnf.api_key = "SOME_API_KEY_PROVIDED_FROM_IP_INFO_DB_SITE"
	end

Set before_filter in your ApplicationController or wherever you need.

	before_filter :set_timezone

That's it. You are ready to go!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Tests

See staging branch for relevant rspec tests.
