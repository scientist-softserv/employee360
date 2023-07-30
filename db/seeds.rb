# db/seeds.rb

# Seed data for users with goals
users_data = [
  {
    email: 'user1@example.com',
    password: 'password123',
    name: 'Developer Jane',
    start_date: Date.new(2021, 1, 15),
    title: 'Software Engineer',
    last_promotion: Date.new(2022, 6, 30),
    current_compensation: 75000,
    due_for_promotion: "false",
    review_document: 'Link to review document for user 1',
    last_1_on_1: Date.new(2022, 6, 30),
    next_1_on_1: Date.new(2022, 6, 30),
    role: :employee,
    goals_attributes: [
      { title: 'Learn Ruby on Rails', description: 'Build a Ruby on Rails application', due_date: Date.new(2023, 1, 15) },
      { title: 'Improve JavaScript Skills', description: 'Complete a JavaScript project', due_date: Date.new(2023, 2, 28) }
      # Add more goals for user1 as needed
    ]
  },
  {
    email: 'admin@example.com',
    password: 'adminpassword',
    name: 'Robot Kaufamn',
    start_date: Date.new(2020, 3, 5),
    title: 'Administrator',
    last_promotion: Date.new(2021, 7, 15),
    current_compensation: 100000,
    due_for_promotion: "true",
    review_document: 'Link to review document for admin user',
    last_1_on_1: Date.new(2022, 6, 30),
    next_1_on_1: Date.new(2022, 6, 30),
    role: :admin,
    goals_attributes: [
      { title: 'Complete Project Management Course', description: 'Improve project management skills', due_date: Date.new(2023, 3, 15) },
      { title: 'Lead a Team Project', description: 'Manage a team and deliver a successful project', due_date: Date.new(2023, 4, 30) }
      # Add more goals for admin as needed
    ]
  }
  # Add more user records as needed
]

# Create the users with associated goals
users_data.each do |user_data|
  goals_data = user_data.delete(:goals_attributes)
  user = User.create!(user_data)
  user.goals.create!(goals_data) if goals_data.present?
end
