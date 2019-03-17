# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(login: 'User_1')
User.create(login: 'User_2')
User.create(login: 'User_3')

Category.create(title: 'web development')
Category.create(title: 'software development')
Category.create(title: 'game development')

Test.create(title: 'Ruby', level: 2, category_id: 1)
Test.create(title: 'Rails', level: 3, category_id: 1)
Test.create(title: 'Swift', level: 1, category_id: 2)

Question.create(body: 'Question1?', test_id: 1)
Question.create(body: 'Question2?', test_id: 2)
Question.create(body: 'Question3?', test_id: 3)

Answer.create(body: 'yes', correct: true, question_id: 1)
Answer.create(body: 'no', question_id: 1)
Answer.create(body: 'maybe', question_id: 1)

UserTest.create(user_id: 1, test_id: 1)
UserTest.create(user_id: 1, test_id: 2)
UserTest.create(user_id: 1, test_id: 3)