User.create!(name: "RAD",
             email: "example@rad2020.org",
             mobile: "0422222222",
             password: "Rails2020",
             password_confirmation: "Rails2020")

99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email()
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               mobile: "0422222222",
               password_confirmation: password)
end

users = []

for user in User.all
  users.append(user)
end

topics = ["News", "A.I.", "V.R.", "RMIT", "Game", "Rails", "Go", "Web", "M.L", "Joke", "React", "Vue", "Node", "iOS", "AWS"]

for topic in topics
  rand(50).times do |n|
    Micropost.create!(content: Faker::Lorem.paragraph(sentence_count: rand(20..60)),
                      user_id: users.sample.id,
                      title: Faker::Lorem.sentence(word_count: rand(2..15)), views: rand(1000000), topic: topic)
  end
end
