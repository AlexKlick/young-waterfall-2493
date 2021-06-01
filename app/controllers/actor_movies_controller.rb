class ActorMoviesController < ApplicationController
  def create
    if actor = Actor.where(name: params[:name]).first
      ActorMovie.create!(movie_id: params[:movie_id], actor_id:actor.id)
      redirect_to "/movies/#{params[:movie_id]}"
    end
  end
end
