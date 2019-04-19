# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users = User.create([{login: 'User_1'}, {login: 'User_2'}, {login: 'User_3'}])
categories = Category.create([{title: 'web development'}, {title: 'software development'}, {title: 'game development'}])
tests = Test.create([{title: 'Ruby', level: 2, category_id: categories[0].id}, {title: 'Rails', level: 3, category_id: categories[0].id}, {title: 'Swift', level: 1, category_id: categories[1].id}])
questions = Question.create([{body: 'Question1?', test_id: tests[0].id}, {body: 'Question2?', test_id: tests[1].id}, {body: 'Question3?', test_id: tests[2].id}])
answers = Answer.create([{body: 'yes', correct: true, question_id: questions[0].id}, {body: 'no', question_id: questions[0].id}, {body: 'maybe', question_id: questions[0].id}])
