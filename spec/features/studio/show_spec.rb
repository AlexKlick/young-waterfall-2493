require 'rails_helper'


describe 'studio show page' do 
  before(:each) do
    @studio = Studio.create(name:"Warner Bros", location:"Hollywood, CA")
    @movie1 = Movie.create(title:"The Matrix", creation_year:1999, genre:"Sci-Fi", studio_id: @studio.id)
    @movie2 = Movie.create(title:"Inception", creation_year:2010, genre:"Sci-Fi", studio_id: @studio.id)
    @movie3 = Movie.create(title:"The Matrix Reloaded", creation_year:2002, genre:"Sci-Fi", studio_id: @studio.id)
    @actor1 = Actor.create(name:"Lawrence Fishbourne", age:59, currently_working:true)
    @actor2 = Actor.create(name:"Keanu Reeves", age:56, currently_working:true)
    @actor3 = Actor.create(name:"Gloria Foster", age:67, currently_working:false)
    amove1 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor1.id)
    amove2 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor2.id)
    amove3 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor3.id)
    amove4 = ActorMovie.create(movie_id: @movie2.id, actor_id:@actor2.id)
  end
# Story 1
# Studio Show

# As a user,
# When I visit a studio show page
# I see the studio's name and location
# And I see the titles of all of its movies

  it 'has the studio name and location and the titles of all of its movies' do
    visit "/studios/#{@studio.id}"
    expect(page).to have_content("Warner Bros Studio")
    expect(page).to have_content("located in Hollywood, CA")
    expect(page).to have_content("The Matrix")
    expect(page).to have_content("Inception")
  end

#   Story 2
# Studio's Actors

# As a user,
# When I visit a studio show page
# I see a list of actors that have acted in any of the studio's movies
# And I see that the list of actors is unique (no duplicate actors)
# And I see that the list of actors is ordered from oldest actor to youngest
# And I see that the list of actors only includes actors that are currently working

  it 'has all of the actors that have worked with the studio' do
    visit "/studios/#{@studio.id}"
    #check unique names
    expect(page).to have_content("Keanu Reeves", count:1)
    expect(page).to have_content("Lawrence Fishbourne", count:1)
    #oldest first
    expect(page.text.index(@actor1.name)).to be < page.text.index(@actor2.name)
    #not working not there
    expect(page).to_not have_content("Gloria Foster")
  end
end