class UsersController < ApplicationController

         #renders login page (form)
         get '/login' do
          redirect_if_logged_in
          erb :login
        end
      
        # the purpose of this route is to receive the login form,
        # find the user, and log the user in (create a session)
        post '/login' do
          # params looks like: {email: "user@user.com", password: "password"}
          # Find the user
          @user = User.find_by(email: params[:email])
          # Authenticate the user - verify the user is who they say they are
          # they have the credentials - email/password combo
          if @user && @user.authenticate(params[:password])
            # log the user in - create the user session
            session[:user_id] = @user.id # actually logging the user in
            # redirect to the user's show page
      
            flash[:message] = "Welcome, #{@user.name}!"
            redirect "users/#{@user.id}"
          else
            flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
            # tell the user they entered invalid credentials
            # redirect them to the login page
            redirect '/login'
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

    #logout method
    get '/logout' do
      session.clear
      redirect '/'
    end





end



