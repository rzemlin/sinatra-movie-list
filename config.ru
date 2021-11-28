require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#the following line of code is to enable PATCH and DELETE function
use Rack::MethodOverride

run ApplicationController
