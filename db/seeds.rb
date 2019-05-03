# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users = User.create([{login: 'User_1'}, {login: 'User_2'}, {login: 'User_3'}])
categories = Category.create([{title: 'mathematics'},
                              {title: 'literature'},

tests = Test.create([{title: 'Plus', level: 1, category_id: categories[0].id},
                     {title: 'Minus', level: 2, category_id: categories[0].id},

questions_1 = Question.create([{body: '5 + 5', test_id: tests[0].id},
                             {body: '8 + 4', test_id: tests[0].id},
                             {body: '16 + 11', test_id: tests[0].id}])
questions_2 = Question.create([{body: '5 - 5', test_id: tests[1].id},
                               {body: '8 - 4', test_id: tests[1].id},
                               {body: '16 - 11', test_id: tests[1].id}])


answers_1_1 = Answer.create([{body: '10', correct: true, question_id: questions[0].id},
                         {body: '12', question_id: questions[0].id},
                         {body: '8', question_id: questions[0].id}])
answers_1_2 = Answer.create([{body: '14', question_id: questions[1].id},
                             {body: '12', correct: true, question_id: questions[1].id},
                             {body: '18', question_id: questions[1].id}])
answers_1_3 = Answer.create([{body: '27', correct: true, question_id: questions[2].id},
                             {body: '25', question_id: questions[2].id},
                             {body: '37', question_id: questions[2].id}])
answers_2_1 = Answer.create([{body: '0', correct: true, question_id: questions[0].id},
                             {body: '1', question_id: questions[0].id},
                             {body: '5', question_id: questions[0].id}])
answers_2_2 = Answer.create([{body: '3', question_id: questions[1].id},
                             {body: '4', correct: true, question_id: questions[1].id},
                             {body: '5', question_id: questions[1].id}])
answers_2_3 = Answer.create([{body: '5', correct: true, question_id: questions[2].id},
                             {body: '15', question_id: questions[2].id},
                             {body: '8', question_id: questions[2].id}])