puts "Очистка базы данных"

Rake::Task['db:clean'].invoke

puts "Заполнение базы данных..."

5.times do
  user = User.create!(email: Faker::Internet.email, password: 'password')
  category = Category.create!(name: Faker::Commerce.department(max: 1))
  Post.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.sentence(word_count: 250), creator: user, category: category)
end

puts "Готово"
