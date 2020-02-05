require 'carrierwave'
require './bin/environment'


use Rack::MethodOverride
use VideoPostsController
use UsersController
run ApplicationController