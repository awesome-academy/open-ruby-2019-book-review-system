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

users = User.order(:created_at)
users.each do |user|
  name = Faker::Book.title
  author = Faker::Book.author
  user.books.create!(
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

users = User.order(:created_at)
users.each do |user|
user.posts.create!(
  title: "Post of #{user.name}",
  content: Faker::Lorem.sentence(5),
  upvote: 2,
  downvote: 1,
  status: 0,
  favorite: true,
  book_id:1)
end

users = User.order(:created_at)
users.each do |user|
  post = Post.find_by(id: user.id)
  user.comments.create!(
    content: Faker::Lorem.paragraph,
    post_id: post.id)
end
