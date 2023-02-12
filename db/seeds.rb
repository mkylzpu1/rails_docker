# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create(name: 'TOEIC')
Category.create(name: 'TOEFL')
Category.create(name: 'IELTS')
Category.create(name: 'Conversation')
Category.create(name: 'Vocablary')
Category.create(name: 'Grammar')
Category.create(name: 'Others')

Section.create(name: 'All')
Section.create(name: 'Listening')
Section.create(name: 'Reading')
Section.create(name: 'Part1')
Section.create(name: 'Part2')
Section.create(name: 'Part3')
Section.create(name: 'Part4')
Section.create(name: 'Part5')
Section.create(name: 'Part6')
Section.create(name: 'Part7')
Section.create(name: 'Others')
