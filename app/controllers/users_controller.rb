class UsersController < ApplicationController

  #renders login page (form)
  get '/login' do
    redirect_if_logged_in
    erb :login
  end
      
  #retreive login form, find user, create session
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.name}!"
      redirect "users/#{@user.id}"
    else
      flash[:message] = "***Your credentials were invalid.  Please sign up or try again***"
      redirect '/login'
    end
  end

  #renders signup page (form)
  get '/signup' do
    erb :signup
  end

  #Create new user and push to db or redirect
  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Hello #{@user.name}, you have successfully created an account"
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
      redirect '/signup'
    end
  end
    
  #user show route
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :'users/show'
  end

  #logout method
  get '/logout' do
    session.clear
    flash[:message] = "***You have successfully logged out***"
    redirect '/'
  end
end