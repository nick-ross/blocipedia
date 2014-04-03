User.destroy_all
Wiki.destroy_all
Collaboration.destroy_all

u = User.new(email: 'admin@blocipedia.com', password: 'password', password_confirmation: 'password')
u.skip_confirmation! && u.save!

rand(5..10).times do
  u = User.new(name: Faker::Name.name,
                email: Faker::Internet.free_email,
                password: 'password',
                password_confirmation: 'password')
  u.skip_confirmation! && u.save!
end

users = User.all

rand(20..30).times do
  user = users.sample
  w = Wiki.create(title: Faker::HipsterIpsum.words(rand(1..8)).join(' ').capitalize,
                  body: Faker::HipsterIpsum.paragraphs(rand(1..2)).join('\n'),
                  user: users.sample)
end
