Rails.application.routes.draw do

  mount TimezoneDetection::Engine => "/timezone_detection"
end
