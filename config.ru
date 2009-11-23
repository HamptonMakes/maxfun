# RAILS_ROOT/config.ru 
require "server/config/environment" 
use Rails::Rack::LogTailer 
use Rails::Rack::Static 
run ActionController::Dispatcher.new 