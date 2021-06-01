# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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