require 'randomdata'

50.times do

   wiki = Wiki.create!(

     title: RandomData.random_sentence,
     body:  RandomData.random_paragraph
   )
  
 end

 wikis = Wiki.all
 
 
 