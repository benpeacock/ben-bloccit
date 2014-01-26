require 'faker'

# rand(10..30).times do
  24.times do
  p = Post.create(title: Faker::Lorem.words(8).join(" "), body: Faker::Lorem.paragraphs(2).join("\n"))
  # rand(3..10).times do
  	7.times do
    p.comments.create(body: Faker::Lorem.paragraphs(2).join("\n"))
  end
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"