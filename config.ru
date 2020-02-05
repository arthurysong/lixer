require 'carrierwave'

CarrierWave.configure do |config|
    config.root = File.dirname(__FILE__) + '/public'
end

require './bin/environment'

use Rack::MethodOverride
use VideoPostsController
use UsersController
run ApplicationController