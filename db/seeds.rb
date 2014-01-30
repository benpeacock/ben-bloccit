require 'faker'

5.times do
	password = Faker::Lorem.characters(10)
	u = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: password,
		password_confirmation: password)
	u.skip_confirmation!
	u.save


# rand(10..30).times do
	  24.times do
	  p = Post.create(title: Faker::Lorem.words(8).join(" "), body: Faker::Lorem.paragraphs(2).join("\n"))
	  # rand(3..10).times do
	  	7.times do
	    p.comments.create(body: Faker::Lorem.paragraphs(2).join("\n"))
	  end
	end
end

u = User.first
u.skip_reconfirmation!
u.update_attributes(email: 'ben9910@gmail.com', password: 'helloworld', password_confirmation: 'helloworld')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"