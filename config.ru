require './config/environment'



#the following line of code is to enable PATCH and DELETE function
use Rack::MethodOverride

#other controllers mounted here:
use UsersController
use MoviesListController
run ApplicationController
