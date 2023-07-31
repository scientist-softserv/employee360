require 'faker'
require 'action_view'

# Include the NumberHelper module to gain access to number_with_delimiter
include ActionView::Helpers::NumberHelper

# Helper method to generate a fake income value with commas as thousand separators
def fake_income
  # Generate a random number between 1000 and 999999999 (adjust the range as needed)
  income = Faker::Number.between(from: 1000, to: 999_999_999)

  # Format the number as currency with commas as thousand separators and two decimal places
  formatted_income = number_with_delimiter(sprintf("%.2f", income.to_f / 100), delimiter: ',')
  "$" + formatted_income
end

# Helper method to generate random date within a range
def random_date(from, to)
  rand(from..to)
end

# Helper method to generate a random internet URL link
def random_url
  Faker::Internet.url
end

users_data = []

# Create 10 random users
10.times do
  users_data << {
    email: Faker::Internet.email,
    github_handle: Faker::Internet.user_name(specifier: 5..15),
    password: 'testing123',
    name: Faker::Name.name,
    start_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 1, 1)),
    title: Faker::Job.title,
    last_promotion: random_date(Date.new(2019, 1, 1), Date.new(2023, 1, 1)),
    current_compensation: fake_income,
    due_for_promotion: Faker::Boolean.boolean(true_ratio: 0.5).to_s,
    review_document: random_url,
    last_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    next_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    role: :employee,
    goals_attributes: [
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) },
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) }
    ]
  }
end

# Create 2 random admins
2.times do
  users_data << {
    email: Faker::Internet.email,
    github_handle: Faker::Internet.user_name(specifier: 5..15),
    password: 'testing123',
    name: Faker::Name.name,
    start_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 1, 1)),
    title: Faker::Job.title,
    last_promotion: random_date(Date.new(2019, 1, 1), Date.new(2023, 1, 1)),
    current_compensation: fake_income,
    due_for_promotion: Faker::Boolean.boolean(true_ratio: 0.5).to_s,
    review_document: random_url,
    last_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    next_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    role: :admin,
    goals_attributes: [
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) },
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) }
    ]
  }
end

users_data << {
  email: 'admin@example.com',
  github_handle: Faker::Internet.user_name(specifier: 5..15),
  password: 'testing123',
  name: 'Administrator Sally',
  start_date: Date.new(2020, 3, 5),
  title: 'Administrator',
  last_promotion: Date.new(2021, 7, 15),
  current_compensation: fake_income,
  due_for_promotion: "true",
  review_document: random_url,
  last_1_on_1: Date.new(2022, 6, 30),
  next_1_on_1: Date.new(2022, 6, 30),
  role: :admin,
  goals_attributes: [
    { title: 'Complete Project Management Course', description: 'Improve project management skills', due_date: Date.new(2023, 3, 15) },
    { title: 'Lead a Team Project', description: 'Manage a team and deliver a successful project', due_date: Date.new(2023, 4, 30) }
    # Add more goals for admin as needed
  ]
}

users_data << {
  email: 'user@example.com',
  github_handle: Faker::Internet.user_name(specifier: 5..15),
  password: 'testing123',
  name: 'Developer Jane',
  start_date: Date.new(2021, 1, 15),
  title: 'Software Engineer',
  last_promotion: Date.new(2022, 6, 30),
  current_compensation: fake_income,
  due_for_promotion: "false",
  review_document: random_url,
  last_1_on_1: Date.new(2022, 6, 30),
  next_1_on_1: Date.new(2022, 6, 30),
  role: :employee,
  goals_attributes: [
    { title: 'Learn Ruby on Rails', description: 'Build a Ruby on Rails application', due_date: Date.new(2023, 1, 15) },
    { title: 'Improve JavaScript Skills', description: 'Complete a JavaScript project', due_date: Date.new(2023, 2, 28) }
  ]
}

# Create the users with associated goals
users_data.each do |user_data|
  goals_data = user_data.delete(:goals_attributes)
  user = User.create!(user_data)
  user.goals.create!(goals_data) if goals_data.present?
end
