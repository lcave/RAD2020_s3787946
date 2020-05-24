rad = User.create!(name: "RAD",
                   email: "example@rad2020.org",
                   mobile: "0422222222",
                   password: "Rails2020",
                   password_confirmation: "Rails2020")
Verification.create!(name: rad.name, user_id: rad.id)

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email()
  password = "password"
  user = User.create!(name: name,
                      email: email,
                      password: password,
                      mobile: "0422222222",
                      password_confirmation: password)
  Verification.create!(name: name, user_id: user.id)
end

users = []

for user in User.all
  users.append(user)
end

topics = ["News", "A.I.", "V.R.", "RMIT", "Game", "Rails", "Go", "Web", "M.L", "Joke", "React", "Vue", "Node", "iOS", "AWS"]

for topic in topics
  rand(5..15).times do |n|
    Micropost.create!(content: Faker::Lorem.paragraph(sentence_count: rand(20..60)),
                      user_id: users.sample.id,
                      title: Faker::Lorem.sentence(word_count: rand(2..15)), views: rand(2000), topic: topic)
  end
end

Micropost.all.each do |post|
  rand(0..10).times do
    Comment.create!(body: Faker::Lorem.sentence(word_count: rand(2..15)),
                    user_id: users.sample.id,
                    commentable: post)
    count = post.comment_count
    post.update(comment_count: count + 1)
  end
end

Comment.all.each do |comment|
  rand(0..2).times do
    Comment.create!(body: Faker::Lorem.sentence(word_count: rand(2..15)),
                    user_id: users.sample.id,
                    commentable: comment)
    count = Micropost.find_by_id(comment.commentable_id).comment_count
    if Micropost.find_by_id(comment.commentable_id)
      Micropost.find_by_id(comment.commentable_id).update(comment_count: count + 1)
    end
  end
end
