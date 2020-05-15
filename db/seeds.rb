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

Micropost.create!(content: "General Kenobi",
                  user_id: 1,
                  title: "Hello there")
