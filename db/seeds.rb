# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
     title = Faker::Book.title
     publisher = Faker::Book.publisher
     genre = Faker::Book.genre
     book = Book.create!(title: title,
                     publisher: publisher,
                         genre: genre)
    10.times do |i|
      name = Faker::Name.name
      address = Faker::Address.street_address
      book.authors.create!(name: name, address: address)
    end
end
