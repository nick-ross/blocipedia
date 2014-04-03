# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Wiki.destroy_all
Collabo.destroy_all
Plan.destroy_all

u1 = User.create(email: 'beaugaines@yahoo.com', password: 'password', password_confirmation: 'password')
u2 = User.create(email: 'guy@guy.com', password: 'password', password_confirmation: 'password')
u3 = User.create(email: 'nothaguy@guy.com', password: 'password', password_confirmation: 'password')
u4 = User.create(email: 'thirdguy@guy.com', password: 'password', password_confirmation: 'password')

users = [u1, u2, u3, u4]

rand(20..30).times do
  user = users.sample
  w = Wiki.create(title: Faker::HipsterIpsum.words(rand(1..8)).join(' ').capitalize,
                  content: Faker::HipsterIpsum.paragraphs(rand(1..2)).join('\n'),
                  user_id: user.id)
end

Plan.create(
  name: 'Starving Artist',
  price: 0.00
)

Plan.create(
  name: 'High Rollla',
  price: 9.99
)

