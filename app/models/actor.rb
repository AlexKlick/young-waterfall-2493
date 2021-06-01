class Actor < ApplicationRecord
  has_many :actor_movies, dependent: :destroy
  has_many :movies, through: :actor_movies
end