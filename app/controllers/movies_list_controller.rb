class MoviesListController < ApplicationController

  #show all movies
  get '/movie_list' do
    @movies_list = MovieEntry.all
    erb :"movies_list/index"
  end
  
  #load new entry form
  get "/movie_list/new" do
    erb :"/movies_list/new"
  end
  
  #create new movie in db or redirect
  post "/movie_list" do
    redirect_if_not_logged_in
    if params[:title] != "" && params[:content] != ""
      flash[:message] = "***Successfully created a new entry***"
      @movie_entry = MovieEntry.create(title: params[:title], content: params[:content], user_id: current_user.id)
      redirect "/movies_list/#{@movie_entry.id}"
    else 
      flash[:message] = "***Please enter a valid title and description to successfully create a new entry***"
      redirect 'movie_list/new'
    end
  end
  
  #load movie show page
  get "/movies_list/:id" do
    set_movie_entry
    erb :"/movies_list/show"
  end

  #render edit form
  get '/movies_list/:id/edit' do
    set_movie_entry
    redirect_if_not_logged_in
    if authorized_to_edit?(@movie_entry)
      erb :'movies_list/edit'
    else
      redirect "/user/#{current_user.id}"
    end
  end
  
  #update current movie
  patch '/movie_list/:id' do
    set_movie_entry
    redirect_if_not_logged_in
    if @movie_entry.user == current_user && params[:content] != ""
      @movie_entry.update({title: params[:title], content: params[:content]})
      redirect "/movies_list/#{@movie_entry.id}"
    else
      flash[:message] = "***Unable to update a blank entry***"
      redirect "/movies_list/#{@movie_entry.id}/edit"
    end
  end
  
  #delete from db
  delete '/movies_list/:id' do
    set_movie_entry
    if authorized_to_edit?(@movie_entry)
      @movie_entry.destroy
      flash[:message] = "***Successfully deleted previous entry***"
      redirect '/movie_list'
    else
      redirect '/movie_list'
    end
  end

  private #only to be used within movies_list_controller

  def set_movie_entry
    @movie_entry = MovieEntry.find(params[:id])
  end

end