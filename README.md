# INTRODUCTION

This gem used for setting client's timezone based on his/her IP.

# INSTALLATION
	
Write it in your Gemfile

	gem "timezone_detection", '~> 0.0.4'

Next, execute following sequences of commands:

	rails generate timezone_detection:install
	
	rake db:migrate

This gem uses IpInfoDb web service to determine your timezone. API KEY required for dealing with site API, so you should register your own and set it in initializer file ( for this visit http://ipinfodb.com/ ):

For example: *config/initializers/my_own_timezone_initializer.rb*

	TimezoneDetection.config do |cnf|
		cnf.api_key = "SOME_API_KEY_PROVIDED_FROM_IP_INFO_DB_SITE"
	end
	
# USAGE

Set before_filter in your ApplicationController or wherever you need.

	before_filter :set_timezone

That's it. You are ready to go!
