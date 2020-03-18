10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

15.times do
  name = Faker::Book.genre
  Category.create!(name: name)
end

10.times do
  name = Faker::Book.title
  author = Faker::Book.author
  Book.create!(
  name: name,
  author: author)
end

books = Book.order(:created_at)
books.each do |b|
  categories = Category.order("RAND()").take(2)
  categories.each do |c|
    BookCategory.create!(book_id: b.id, category_id: c.id)
  end
end
books = Book.order(:created_at)
users = User.order(:created_at)
books.each do |book|
  users.each do |user|
  user.posts.create!(
    title: "Post of #{user.name}",
    content: Faker::Lorem.sentence(5),
    upvote: 2,
    downvote: 1,
    status: 1,
    favorite: true,
    book_id: book.id)
  end
end
