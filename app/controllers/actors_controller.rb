class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
    @actors = Actor.worked_with(@actor)
    @actors.delete(@actor.name)
  end
end
