# frozen_string_literal: true

User.create!(
  email: 'admin@example.com',
  password: 'example',
  password_confirmation: 'example',
  name: 'Admin User',
  roles: 'site_admin'
)

puts '1 Admin user created'

User.create!(
  email: 'user@example.com',
  password: 'example',
  password_confirmation: 'example',
  name: 'User'
)

puts '1 Regular user created'

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts '3 Topics created'
10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: Faker::Lorem.paragraph_by_chars(255),
    topic_id: Topic.last.id
  )
end
puts '10 blog post created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end
puts '5 skills added'

8.times do |portfolio_item|
  Potfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: Faker::Company.buzzword,
    body: Faker::Lorem.paragraph_by_chars(255),
    main_image: 'http://placehold.it/600X400',
    thumb_image: 'http://placehold.it/350X150'
  )
end

1.times do |portfolio_item|
  Potfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: 'Angular',
    body: Faker::Lorem.paragraph(2),
    main_image: 'http://placehold.it/600X400',
    thumb_image: 'http://placehold.it/350X150'
  )
end
puts '9 portfolio added '

3.times do |technology|
  Potfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts '3 technologies created'
