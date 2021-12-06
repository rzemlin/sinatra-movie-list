class MoviesListController < ApplicationController

#get movies/new to render a form to create new entries

#post request for new movies

#show route for new Movie

#index route for all Movies
get "/movie_list/new" do
    erb :"/movies_list/new"

end

post "/movie_list" do
    
    if !logged_in?
        redirect '/'
    end

    if params[:title] != "" && params[:content] != ""
        @movie_entry = MovieEntry.create(title: params[:title], content: params[:content], user_id: current_user.id)
        redirect "/movies_list/#{@movie_entry.id}"
    else 
        redirect 'movies_list/new'
    end

end

get "/movies_list/:id" do
    @movie_entry = MovieEntry.find(params[:id])
    erb :"/movies_list/show"
end

get '/movies_list/:id/edit' do
    @movie_entry = MovieEntry.find(params[:id])
    erb :'movies_list/edit'
  end




end
