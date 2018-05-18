require 'randomdata'

50.times do

   wiki = Wiki.create!(

     title: RandomData.random_sentence,
     body:  RandomData.random_paragraph
   )
  
 end


 
 
 50.times do
     user = User.create!(
         email: RandomData.random_word + '@' + RandomData.random_word,
         password: RandomData.random_sentence
         )
         
     end
     
  

puts "seeding finished"     
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
 
 
 