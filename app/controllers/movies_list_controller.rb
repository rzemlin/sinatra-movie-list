class MoviesListController < ApplicationController

#get movies/new to render a form to create new entries

#post request for new movies

#show route for new Movie

#index route for all Movies
get '/movie_list' do
    @movies_list = MovieEntry.all
    erb :"movies_list/index"
end

get "/movie_list/new" do
    erb :"/movies_list/new"

end

post "/movie_list" do
    
    if !logged_in?
        redirect '/'
    end

    if params[:title] != "" && params[:content] != ""
        flash[:message] = "Successfully created a new entry"
        @movie_entry = MovieEntry.create(title: params[:title], content: params[:content], user_id: current_user.id)
        redirect "/movies_list/#{@movie_entry.id}"
    else 
        flash[:message] = "Please enter a valid title and description to create a new entry"
        redirect 'movie_list/new'
    end

end

get "/movies_list/:id" do
    set_movie_entry
    erb :"/movies_list/show"
end

get '/movies_list/:id/edit' do
    set_movie_entry
    if logged_in?
        if authorized_to_edit?(@movie_entry)
            erb :'movies_list/edit'
        else
            redirect "/user/#{current_user.id}"
        end
    else
        redirect '/'
    end

end

  patch '/movie_list/:id' do
    set_movie_entry
    if logged_in?
        
        if @movie_entry.user == current_user && params[:content] != ""
            @movie_entry.update({title: params[:title], content: params[:content]})
            redirect "/movies_list/#{@movie_entry.id}"
        else
            redirect "/users/#{current_user.id}"
        end
        
     else
        redirect '/'
     end
  end

  delete '/movies_list/:id' do
    set_movie_entry
    if authorized_to_edit?(@movie_entry)
      @movie_entry.destroy
      flash[:message] = "Successfully deleted that entry."
      redirect '/movie_list'
    else
      redirect '/movie_list'
    end
  end

   private

  def set_movie_entry
    @movie_entry = MovieEntry.find(params[:id])
  end





end
