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
         session[:user_id] = @user.id #actually logging in
              #log the user in -- create session
              #redirect to (show, dashboard, home
              puts session
         redirect "users/#{@user.id}"
        else
            #tell user they entered incorrect credentials
            #redirect to login page
        
      end
    end

    #renders signup page (form)
    get '/signup' do
        erb :signup

    end

    post '/users' do
      #here we will create and persist a new user to the database
    end
    

    #user show route
    get '/users/:id' do
      "this will be the user show route"
    end



end



