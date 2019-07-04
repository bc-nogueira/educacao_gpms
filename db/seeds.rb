# puts ' ### Start seeding'
#
# admin = User.create(name: 'Admin', email: 'admin@gmail.com', password: '123456',
#                     birthdate: Date.today - 20.years, cpf: '33333333333',
#                     gender: :male, admin: true)
#
# breno = User.create(name: 'Breno', email: 'breno@gmail.com', password: '123456',
#                     birthdate: Date.today - 20.years, cpf: '11111111111',
#                     gender: :male)
#
# joao = User.create(name: 'Joao', email: 'joao@gmail.com', password: '123456',
#                     birthdate: Date.today - 20.years, cpf: '22222222222',
#                     gender: :male)
#
# Student.create(user: admin)
# Student.create(user: breno)
# Student.create(user: joao)
#
# teacher = Teacher.create(user_id: breno.id, phone_number: '99999999')
#
# Discount.create(title: 'Páscoa', discount: 30, start_date: Date.today - 1.month,
#                 end_date: Date.today + 1.month)
#
# Course.create(name: 'Rails', description: 'Rails', syllabus: 'Rails',
#               price: 100, teacher: teacher)
#
# Course.create(name: 'PHP', description: 'PHP', syllabus: 'PHP', price: 200,
#               teacher: teacher)
#
# puts ' ### Finished seeding'