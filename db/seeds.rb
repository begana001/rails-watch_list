require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning Database..."

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
ListLike.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"

### Movies
10.times do |i|
  puts "Imporing movies from page #{i + 1}..."
  movies = JSON.parse(open("#{url}?page=#{i + 1}").read)["results"]
  movies.each do |movie|
    puts "Creating moive #{movie["title"]}..."
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["poster_path"]}",
      backdrop_url:  "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end

### Users
200.times do 
  User.create(email:Faker::Internet.free_email, encrypted_password: Faker::Internet.password)
end

### Lists, bookmarks and list_likes
100.times do |i|
  list = List.create(name: Faker::Emotion.noun, description: Faker::Lorem.paragraph)
  puts "creating list #{list.name}..."

  random = rand(1..10)

  ### bookmarks
  movies = Movie.all.sample(random)
  movies.each do |movie|
    puts "create #{movie.title} bookmark.."
    Bookmark.create(
      comment: Faker::Lorem.paragraph(sentence_count: 2),
      movie_id: movie.id,
      list_id: list.id,
      rating: rand(1..10)
    )
  end

  ### list_likes
  like_random = rand(1..200)
  like_random.times do
    puts "give #{like_random} times like to #{list.name}..."
    ListLike.create(user_id: User.all.sample, list_id: list.id)
  end
end

puts "Finished!"
