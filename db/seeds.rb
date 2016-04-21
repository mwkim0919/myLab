User.create!(name:  "Minwoo Kim",
             email: "mwkim0919@gmail.com",
             password:              "111111",
             password_confirmation: "111111",
             admin: true)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

# users = User.order(:created_at).take(6)
# 50.times do
#   title = Faker::Lorem.sentence(5)
#   description = Faker::Lorem.sentence(10)
#   start = Date.new(2016,1,1)
#   finish = Date.new(2016,4,1)
#   users.each { |user| user.tasks.create!(title: title, description: description, start: start, finish: finish) }
# end