Rails::ApplicationController.class_eval do
	include TimezoneDetection::ClassMethods
end
