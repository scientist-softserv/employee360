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
    due_for_promotion: Date.new(2023, 12, 31),
    review_document: 'Link to review document for user 1',
    last_1_on_1: 'Notes for last 1-on-1 meeting with user 1',
    next_1_on_1: 'Scheduled time for next 1-on-1 meeting with user 1',
    role: :employee,
    notes: "testing notes block",
    goals_attributes: [
      { title: 'Learn Ruby on Rails', description: 'Build a Ruby on Rails application' },
      { title: 'Improve JavaScript Skills', description: 'Complete a JavaScript project' }
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
    due_for_promotion: Date.new(2024, 1, 1),
    review_document: 'Link to review document for admin user',
    last_1_on_1: 'Notes for last 1-on-1 meeting with admin user',
    next_1_on_1: 'Scheduled time for next 1-on-1 meeting with admin user',
    role: :admin,
    notes: "testing notes block",
    goals_attributes: [
      { title: 'Complete Project Management Course', description: 'Improve project management skills' },
      { title: 'Lead a Team Project', description: 'Manage a team and deliver a successful project' }
      # Add more goals for admin as needed
    ]
  },
  # Add more user records as needed
]

# Create the users with associated goals
users_data.each do |user_data|
  goals_data = user_data.delete(:goals_attributes)
  user = User.create(user_data)
  user.goals.create(goals_data) if goals_data.present?
end
