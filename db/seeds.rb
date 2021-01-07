# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ADD BOOKS
p "Creating books"
(0..10).each do
  book = Faker::Book.unique
  Book.create!(author: book.author, title: book.title)
end

# CREATE BOOKSHELF
p "Creating bookshelves"
(0..3).each do
  bookshelf_params = {
      latitude: rand((52.229676 - 0.05)..(52.229676 + 0.05)),
      longitude: rand((21.012229 - 0.05)..(21.012229 + 0.05))
  }
  Bookshelf.create!(bookshelf_params)
end


# ADD BOOKS TO BOOKSHELVES
p "Adding books to bookshelves"
bookshelves = Bookshelf.all

Book.all.each do |book|
  BookshelfBook.create!(book: book, bookshelf: bookshelves.sample)
end

