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
    @actor4 = Actor.create(name:"Jada Pinkett Smith", age:49, currently_working:true)
    amove1 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor1.id)
    amove2 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor2.id)
    amove3 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor3.id)
    amove4 = ActorMovie.create(movie_id: @movie3.id, actor_id:@actor2.id)
    amove5 = ActorMovie.create(movie_id: @movie3.id, actor_id:@actor4.id)
  end

# Story 3
# Movie Show
 
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and I see all of the actors in the movie
  it 'has the movie title, year, genre and all of the actors' do 
    visit "/movies/#{@movie1.id}"
    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor3.name)
  end

  # Story 4
  # Add an Actor to a Movie
   
  # As a user,
  # When I visit a movie show page,
  # I do not see any actors listed that are not part of the movie
  # And I see a form to add an actor to this movie
  # When I fill in the form with the name of an actor that exists in the database
  # And I click submit
  # Then I am redirected back to that movie's show page
  # And I see the actor's name is now listed

  it 'only has actors from this movie' do
    visit "/movies/#{@movie1.id}"
    expect(page).to_not have_content(@actor4.name)
  end

  it 'has a form to add an actor to the movie, when I add an existing actor, and submit, it redirects to movie page and displays added actor' do
    visit "/movies/#{@movie1.id}"
    fill_in 'name', with: 'Jada Pinkett Smith'
    click_on "commit"
    expect(current_path).to eq("/movies/#{@movie1.id}")
    expect(page).to have_content(@actor4.name)
  end
end