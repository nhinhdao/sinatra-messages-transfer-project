require './config/environment'

use Rack::MethodOverride
use UsersController
use MessagesController
run ApplicationController
