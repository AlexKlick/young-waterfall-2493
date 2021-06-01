class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    sql = "SELECT DISTINCT actors.name, actors.age FROM studios INNER JOIN movies ON movies.studio_id = studios.id INNER JOIN actor_movies ON actor_movies.movie_id = movies.id INNER JOIN actors ON actors.id = actor_movies.actor_id WHERE actors.currently_working = true AND studios.id = #{@studio.id} ORDER BY actors.age DESC"
    @actors = ActiveRecord::Base.connection.execute(sql).values.flatten
  end
end
