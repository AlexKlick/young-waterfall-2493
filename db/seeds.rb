Studio.destroy_all
Actor.destroy_all
Movie.destroy_all
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
@actor4 = Actor.create(name:"Jada Pinkett Smith", age:49, currently_working:true)