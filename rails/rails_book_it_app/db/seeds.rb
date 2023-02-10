
(0..5).each do 
  Category.create(name: Faker::Book.genre, description: Faker::Lorem.paragraph )
end

(0..10).each do 
  book = Book.create(title:Faker::Book.title, summary: Faker::Lorem.paragraph )
  book.categories = Category.all.sample(rand(0..5))
end



