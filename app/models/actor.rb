class Actor < ApplicationRecord
  has_many :actor_movies, dependent: :destroy
  has_many :movies, through: :actor_movies

  def self.worked_with(actor)
    joins(:actor_movies).where(actor_movies: {movie_id: actor.movies.pluck(:id)}).pluck('actors.name').uniq
  end
end