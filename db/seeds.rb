# require 'randomdata'
require 'faker'



 
 
 50.times do
     user = User.create!(
     email: Faker::Internet.unique.email,
     password: Faker::Internet.unique.password
 )
 end
  
  50.times do

   wiki = Wiki.create!(

     title: Faker::Book.title,
     body:  Faker::RickAndMorty.quote,
     user: User.limit(1).order("RANDOM()")
 )
 end

     
  

puts "seeding finished"     
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
 
 
