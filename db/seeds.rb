require 'faker'

topics = []
15.times do
  topics << Topic.create(
    name: Faker::Lorem.words(2),
    description: Faker::Lorem.paragraph(2)
  )
end


2.times do
    password = Faker::Lorem.characters(10)
    u = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password
      )
    u.skip_confirmation!
    u.save
end

  5.times do
    topic = topics.first # getting the first topic here
    p = u.posts.create(
      topic: topic,
      title: Faker::Lorem.words(2).join(" "),
      body: Faker::Lorem.paragraphs(2).join("\n"))
    # set the created_at to a time within the past year
    p.update_attribute(:created_at, Time.now)
    p.update_rank

    topics.rotate! # add this line to move the first topic to the last, so that posts get assigned to different topics.
  end


post_count = Post.count
User.all.each do |user|
  30.times do
    p = Post.find(2)
    c = user.comments.create(
      body: Faker::Lorem.paragraphs(1).join("\n"),
      post: p)
    c.update_attribute(:created_at, Time.now)
  end
end



u = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')

u = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"