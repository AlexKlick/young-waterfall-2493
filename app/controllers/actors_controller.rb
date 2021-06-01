class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
    movies = @actor.movies.pluck(:id)
    @actors = Actor.joins(:actor_movies).where(actor_movies: {movie_id: movies}).pluck('actors.name').uniq
    @actors.delete(@actor.name)
    #sql = "SELECT movies.id FROM movies INNER JOIN actor_movies ON actor_movies.movie_id = movies.id INNER JOIN actors ON actors.id = actor_movies.actor_id WHERE actors.id = 9;"
  end
end
