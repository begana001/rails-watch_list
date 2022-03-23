require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning Database..."

# destroy and clean database
ListLike.destroy_all
MovieLike.destroy_all
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
User.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"

### Movies
10.times do |i|
  puts "Imporing movies from page #{i + 1}..."
  movies = JSON.parse(open("#{url}?page=#{i + 1}").read)["results"]
  movies.each do |movie|
    puts "Creating moive #{movie["title"]}..."
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create!(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["poster_path"]}",
      backdrop_url:  "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end

### Users
60.times do
  user = User.new(
    email: Faker::Internet.safe_email,
    username: Faker::Name.middle_name, 
    password: Faker::Internet.password
  )
  puts "creating user #{user.username}..."
  user.save!
end

movies = Movie.all.sample(10)
movies.each_with_index do |movie, i|
  user = User.all.sample
  MovieReview.create!(
    comment: Faker::Quotes::Shakespeare.hamlet_quote, 
    rating: rand(1..10), movie_id: movie.id, 
    created_at: Date.today, 
    user_id: user.id
  )
  puts "creating comment number #{i}..."
end

### Lists, bookmarks and list_likes
20.times do |i|
  user = User.all.sample
  list = List.create!(
    name: Faker::Book.genre, 
    description: Faker::Quote.famous_last_words, 
    user_id: user.id
  )
  puts "creating list #{list.name}..."

  random = rand(1..10)

  ### bookmarks
  movies = Movie.all.sample(random)
  movies.each do |movie|
    puts "create #{movie.title} bookmark.."
    user = User.all.sample
    Bookmark.create!(
      comment: Faker::Quote.matz,
      movie_id: movie.id,
      list_id: list.id,
      rating: rand(1..10),
      user_id: user.id
    )
  end

  ### list_likes
  # give random amount of like to the list
  like_random = rand(1..10)
  users = User.last(10)
  puts "give #{like_random} times like to #{list.name}..."
  like_random.times do |i|
    user = User.all.sample
    ListLike.create!(
      user_id: users[i].id, 
      list_id: list.id
    )
  end

  ### list_comments
  comments_random = rand(1..10)
  users = User.first(10)
  puts "give #{comments_random} comments to #{list.name}..."
  comments_random.times do |i|
    ListComment.create!(
      comment: Faker::Quotes::Shakespeare.king_richard_iii_quote,
      list_id: list.id,
      user_id: users[i].id
    )
  end
end

puts "Finished!"
