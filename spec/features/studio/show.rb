require 'rails_helper'


describe 'studio show page' do 
# Story 1
# Studio Show

# As a user,
# When I visit a studio show page
# I see the studio's name and location
# And I see the titles of all of its movies

  it 'has the studio name and location and the titles of all of its movies' do
    studio = Studio.create(name:"Warner Bros", location:"Hollywood, CA")
    movie1 = Movie.create(title:"The Matrix", creation_year:1999, genre:"Sci-Fi", studio_id: studio.id)
    movie2 = Movie.create(title:"Inception", creation_year:2010, genre:"Sci-Fi", studio_id: studio.id)

    visit "/studios/#{studio.id}"
    expect(page).to have_content("Warner Bros Studio")
    expect(page).to have_content("located in Hollywood, CA")
    expect(page).to have_content("The Matrix")
    expect(page).to have_content("Inception")
  end
end