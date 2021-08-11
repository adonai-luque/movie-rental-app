# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

categories = [
  {
    name: "Action",
    description: "Action films usually include high energy, big-budget physical stunts and chases, possibly with rescues, battles, fights, escapes, destructive crises (floods, explosions, natural disasters, fires, etc.), non-stop motion, spectacular rhythm and pacing, and adventurous, often two-dimensional 'good-guy' heroes (or recently, heroines) battling 'bad guys' - all designed for pure audience escapism."
  },
  {
    name: "Adventure",
    description: "Adventure films are usually exciting stories, with new experiences or exotic locales, very similar to or often paired with the action film genre. They can include traditional swashbucklers or pirate films, serialized films, and historical spectacles (similar to the epics film genre), searches or expeditions for lost continents, jungle and desert epics, treasure hunts, disaster films, or searches for the unknown."
  },
  {
    name: "Comedy",
    description: "Comedies are light-hearted plots consistently and deliberately designed to amuse and provoke laughter (with one-liners, jokes, etc.) by exaggerating the situation, the language, action, relationships and characters."
  },
  {
    name: "Crime",
    description: "Crime films are developed around the sinister actions of criminals or mobsters, particularly bankrobbers, underworld figures, or ruthless hoodlums who operate outside the law, stealing and murdering their way through life. The criminals or gangsters are often counteracted by a detective-protagonist with a who-dun-it plot. Hard-boiled detective films reached their peak during the 40s and 50s (classic film noir), although have continued to the present day. Therefore, crime and gangster films are often categorized as film noir or detective-mystery films, and sometimes as courtroom/crime legal thrillers - because of underlying similarities between these cinematic forms. This category also includes various 'serial killer' films."
  },
  {
    name: "Drama",
    description: "Dramas are serious, plot-driven presentations, portraying realistic characters, settings, life situations, and stories involving intense character development and interaction. Usually, they are not focused on special-effects, comedy, or action"
  },
  {
    name: "Epic",
    description: "Epics include costume dramas, historical dramas, war films, medieval romps, or 'period pictures' that often cover a large expanse of time set against a vast, panoramic backdrop. Epics often share elements of the elaborate adventure films genre. Epics take an historical or imagined event, mythic, legendary, or heroic figure, and add an extravagant setting or period, lavish costumes, and accompany everything with grandeur and spectacle, dramatic scope, high production values, and a sweeping musical score."
  },
  {
    name: "Horror", 
    description: "Horror films are designed to frighten and to invoke our hidden worst fears, often in a terrifying, shocking finale, while captivating and entertaining us at the same time in a cathartic experience. Horror films feature a wide range of styles, from the earliest silent Nosferatu classic, to today's CGI monsters and deranged humans. They are often combined with science fiction when the menace or monster is related to a corruption of technology, or when Earth is threatened by aliens."
  },
  {
    name: "Musical/Dance",
    description: "Musical/dance films are cinematic forms that emphasize full-scale scores or song and dance routines in a significant way (usually with a musical or dance performance integrated as part of the film narrative), or they are films that are centered on combinations of music, dance, song or choreography."
  },
  {
    name: "Science Fiction",
    description: "Sci-fi films are often quasi-scientific, visionary and imaginative - complete with heroes, aliens, distant planets, impossible quests, improbable settings, fantastic places, great dark and shadowy villains, futuristic technology, unknown and unknowable forces, and extraordinary monsters ('things or creatures from space'), either created by mad scientists or by nuclear havoc."
  },
  {
    name: "War",
    description: "Sci-fi films are often quasi-scientific, visionary and imaginative - complete with heroes, aliens, distant planets, impossible quests, improbable settings, fantastic places, great dark and shadowy villains, futuristic technology, unknown and unknowable forces, and extraordinary monsters ('things or creatures from space'), either created by mad scientists or by nuclear havoc."
  },
  {
    name: "Western",
    description: "Westerns are the major defining genre of the American film industry - a eulogy to the early days of the expansive American frontier. They are one of the oldest, most enduring genres with very recognizable plots, elements, and characters (six-guns, horses, dusty towns and trails, cowboys, Indians, etc.)."
  },
]

puts "Start seeding categories"
categories.each do |category|
  Category.create(name: category[:name], description: category[:description])
end
puts "Finish seeding categories"

puts "Start seeding users"
30.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name: name)
  User.create(name: name, email: email)
end
puts "Finish seeding users"

puts "Start seeding movies"
category_ids = Category.pluck(:id)
100.times do
  name = Faker::Movie.title
  director = Faker::Name.name
  category_id = category_ids.sample
  release_date = Faker::Date.backward
  Movie.create(name:name, director: director, category_id: category_id, release_date: release_date)
end
puts "Finish seeding movies"

puts "Start seeding rentals"
user_ids = User.pluck(:id)
Movie.all.each { |movie| Rental.create(movie_id: movie.id, user_id: user_ids.sample) if [false, true].sample }
puts "Finish seeding rentals"