class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
    #sql = "SELECT movies.id FROM movies INNER JOIN actor_movies ON actor_movies.movie_id = movies.id INNER JOIN actors ON actors.id = actor_movies.actor_id WHERE actors.id = 9;"
    #binding.pry
  end
end
