# db/seeds.rb

# Seed data for users
users_data = [
  {
    email: 'user1@example.com',
    password: 'password123',
    name: 'Developer Jane',
    start_date: Date.new(2021, 1, 15),
    title: 'Software Engineer',
    last_promotion: Date.new(2022, 6, 30),
    current_compensation: 75000,
    due_for_promotion: Date.new(2023, 12, 31),
    review_document: 'Link to review document for user 1',
    last_1_on_1: 'Notes for last 1-on-1 meeting with user 1',
    next_1_on_1: 'Scheduled time for next 1-on-1 meeting with user 1',
    role: :employee
  },
  {
    email: 'admin@example.com',
    password: 'adminpassword',
    name: 'Robot Kaufamn',
    start_date: Date.new(2020, 3, 5),
    title: 'Administrator',
    last_promotion: Date.new(2021, 7, 15),
    current_compensation: 100000,
    due_for_promotion: Date.new(2024, 1, 1),
    review_document: 'Link to review document for admin user',
    last_1_on_1: 'Notes for last 1-on-1 meeting with admin user',
    next_1_on_1: 'Scheduled time for next 1-on-1 meeting with admin user',
    role: :admin
  },
  # Add more user records as needed
]

# Create the users
users_data.each do |user_data|
  User.create(user_data)
end
