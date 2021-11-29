class UsersController < ApplicationController

    #renders login page (form)
    get '/users/login' do
        erb :'users/login'
      end
    
    
      #renders signup page (form)
    get 'users/signup' do
        erb :'users/signup'

    end



end


