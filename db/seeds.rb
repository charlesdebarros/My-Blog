# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  id: 999,
  email: 'test_user@email.com',
  password: 'Password1$',
  password_confirmation: 'Password1$'
)

Post.create(
  id: 999,
  title: 'Post 1',
  content: 'Contrary to popular belief, Lorem Ipsum is not simply random text.',
  slug: nil
)

Project.create(
  id: 999,
  title: 'Web Crawler in Ruby',
  description: 'A basic web crawler written in Ruby',
  link: 'https://github.com/charlesdebarros/Ruby_Web_Crawler'
)
