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
        @user.authenticate(params[:password])
        #log the user oin
        #redirect to (show, dashboard, home)


    end

    
    
      #renders signup page (form)
    get 'users/signup' do
        erb :'users/signup'

    end



end


