# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "admin@example.com", password: "password", full_name: "Admin Administrator", role: User::ADMIN, bio: "i am boss here")
User.create(email: "mare@example.com", password: "password", full_name: "Marko Markovic", bio: "Full stack developer")
User.create(email: "jova@example.com", password: "password", full_name: "Jovan Jovanovic", bio: "Software Engineer")

SiteTitle.create(title: "Ghost CMS")
