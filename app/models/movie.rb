class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies, dependent: :destroy
  has_many :actors, through: :actor_movies
  scope :movie_actors, -> {actors}
end
