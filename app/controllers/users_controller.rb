class UsersController < ApplicationController

    #renders login page (form)
    get '/login' do
        erb :'login'
      end

    #log in user and create a session
      post '/login' do
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate (make sure they have the right credentials)
        if @user.authenticate(params[:password])
            binding.pry
          #log the user in -- create session
          #redirect to (show, dashboard, home
        else
            #tell user they entered incorrect credentials
            #redirect to login page

        end

    end

    
    
      #renders signup page (form)
    get 'users/signup' do
        erb :'users/signup'

    end



end


