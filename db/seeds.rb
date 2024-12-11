puts "Очистка базы данных"

Rake::Task['db:clean'].invoke

puts "Заполнение базы данных..."

5.times do
  user = User.create!(email: Faker::Internet.email, password: 'password')

  category_name = Faker::Commerce.department(max: 1)
  category = Category.find_or_create_by!(name: category_name)

  post = Post.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.sentence(word_count: 250), creator: user, category: category)

  rand(1..10).times { PostLike.create(post: post, user: User.all.sample) }

  2.times do
    root_comment = PostComment.create(content: Faker::Lorem.sentence, post: post, user: user)
    PostComment.create(content: Faker::Lorem.sentence, post: post, user: user, parent: root_comment)
  end
end

puts "Готово"
