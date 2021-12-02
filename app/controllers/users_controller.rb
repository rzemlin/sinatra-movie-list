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
      if params[:name] != "" && params[:email] != "" && params[:params] != ""
      @user = User.create(params)
      if @user.save
        # valid input
        session[:user_id] = @user.id # actually logging the user in
        # where do I go now?
        # let's go to the user show page
        flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
        redirect "/users/#{@user.id}"
      else
        # not valid input
        # it would be better to include a message to the user
        # telling them what is wrong
  
        flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
        redirect '/signup'
      end
    end


      #here we will create and persist a new user to the database
    end
    

    #user show route
    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      #shotgun
      #binding.pry
      #raise params.inspect
      erb :'users/show'
    end




end



