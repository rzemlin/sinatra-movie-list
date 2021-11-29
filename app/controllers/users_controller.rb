class UsersController < ApplicationController

    #renders login page (form)
    get '/users/login' do
        erb :'users/login'
      end

    #log in user and create a session
      post 'users/login' do
        binding.pry


    end

    
    
      #renders signup page (form)
    get 'users/signup' do
        erb :'users/signup'

    end



end


