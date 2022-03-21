require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning Database..."

ListLike.destroy_all
MovieLike.destroy_all
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

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

movies = Movie.all.sample(10)
movies.each_with_index do |movie, i|
  MovieReview.create(comment: Faker::Quotes::Shakespeare.hamlet_quote, rating: rand(1..10), movie_id: movie.id, created_at: Date.today)
  puts "creating comment number #{i}..."
end

### Users
100.times do
  user = User.new(email: Faker::Internet.free_email, password: Faker::Internet.password)
  puts "creating user #{user.email}..."
  user.save!
end

### Lists, bookmarks and list_likes
100.times do |i|
  list = List.create(name: Faker::Book.genre, description: Faker::Quote.famous_last_words)
  puts "creating list #{list.name}..."

  random = rand(1..10)

  ### bookmarks
  movies = Movie.all.sample(random)
  movies.each do |movie|
    puts "create #{movie.title} bookmark.."
    Bookmark.create(
      comment: Faker::Quote.matz,
      movie_id: movie.id,
      list_id: list.id,
      rating: rand(1..10)
    )
  end

  ### list_likes
  like_random = rand(1..100)
  puts "give #{like_random} times like to #{list.name}..."
  like_random.times do
    user = User.all.sample
    ListLike.create(user_id: user.id, list_id: list.id)
  end
end

puts "Finished!"
