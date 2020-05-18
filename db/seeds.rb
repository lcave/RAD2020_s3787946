User.create!(name: "RAD",
             email: "example@rad2020.org",
             mobile: "0422222222",
             password: "Rails2020",
             password_confirmation: "Rails2020")

User.create!(name: "Foo",
             email: "foo@bar.org",
             mobile: "0422222222",
             password: "password",
             password_confirmation: "password")

User.create!(name: "Bar",
             email: "bar@baz.org",
             mobile: "0422222222",
             password: "password",
             password_confirmation: "password")

User.create!(name: "Baz",
             email: "baz@blu.org",
             mobile: "0422222222",
             password: "password",
             password_confirmation: "password")

users = []

for user in User.all
  users.append(user)
end

topics = ["News", "A.I.", "V.R.", "RMIT", "Game", "Rails", "Go", "Web", "M.L", "Joke", "React", "Vue", "Node", "iOS", "AWS"]

for topic in topics
  rand(50).times do |n|
    Micropost.create!(content: "General Kenobi",
                      user_id: users.sample.id,
                      title: "Hello there", views: rand(1000000), topic: topic)
  end
end
