require 'open-uri'
require 'json'

puts "Cleaning Database..."
Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"

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

puts "Finished!"
