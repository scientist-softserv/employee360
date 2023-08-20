require 'faker'
require 'action_view'
require 'yaml'

# Include the NumberHelper module to gain access to number_with_delimiter
include ActionView::Helpers::NumberHelper

# Load salary config data from YAML file
salary_config = YAML.load(File.read('config/salary_config.yml'))
job_titles = salary_config['job_titles']
salary_ranges = salary_config['salary']
change_reasons = salary_config['change_reasons']

# Load change reasons from YAML file
change_reasons = salary_config['change_reasons']
# Exclude "New Hire" since set manually below
change_reasons.delete("New Hire")

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

# Helper method to generate a random salary based on the loaded salary ranges
def random_salary(salary_ranges)
  salary_range = salary_ranges.sample
  min_salary, max_salary = salary_range.split(' - ').map(&:to_i)
  income = Faker::Number.between(from: min_salary, to: max_salary)
  formatted_income = number_with_delimiter(sprintf("%.2f", income.to_f / 100), delimiter: ',')
  "$" + formatted_income
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
    title: job_titles.sample,
    last_promotion: random_date(Date.new(2019, 1, 1), Date.new(2023, 1, 1)),
    current_compensation: random_salary(salary_ranges),
    due_for_promotion: Faker::Boolean.boolean(true_ratio: 0.5).to_s,
    review_document: random_url,
    last_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    next_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    role: :employee,
    goals_attributes: [
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) },
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) }
    ],
    salary_histories_attributes: [
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
        change_reason: change_reasons.sample
      },
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
        change_reason: change_reasons.sample
      },
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
        change_reason: change_reasons.sample
      },
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2014, 1, 1), Date.new(2014, 12, 31)),
        change_reason: "New Hire"
      }
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
    title: job_titles.sample,
    last_promotion: random_date(Date.new(2019, 1, 1), Date.new(2023, 1, 1)),
    current_compensation: random_salary(salary_ranges),
    due_for_promotion: Faker::Boolean.boolean(true_ratio: 0.5).to_s,
    review_document: random_url,
    last_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    next_1_on_1: random_date(Date.new(2022, 1, 1), Date.new(2023, 1, 1)),
    role: :admin,
    goals_attributes: [
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) },
      { title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, due_date: random_date(Date.new(2023, 1, 1), Date.new(2024, 1, 1)) }
    ],
    salary_histories_attributes: [
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
        change_reason: change_reasons.sample
      },
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
        change_reason: change_reasons.sample
      },
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
        change_reason: change_reasons.sample
      },
      {
        job_title: job_titles.sample,
        salary: random_salary(salary_ranges),
        change_date: random_date(Date.new(2014, 1, 1), Date.new(2014, 12, 31)),
        change_reason: "New Hire"
      }
    ]
  }
end

users_data << {
  email: 'admin@example.com',
  github_handle: Faker::Internet.user_name(specifier: 5..15),
  password: 'testing123',
  name: Faker::Name.name,
  start_date: Date.new(2020, 3, 5),
  title: 'Administrator',
  last_promotion: Date.new(2021, 7, 15),
  current_compensation: random_salary(salary_ranges),
  due_for_promotion: "true",
  review_document: random_url,
  last_1_on_1: Date.new(2022, 6, 30),
  next_1_on_1: Date.new(2022, 6, 30),
  role: :admin,
  goals_attributes: [
    { title: 'Complete Project Management Course', description: 'Improve project management skills', due_date: Date.new(2023, 3, 15) },
    { title: 'Lead a Team Project', description: 'Manage a team and deliver a successful project', due_date: Date.new(2023, 4, 30) }
  ],
  salary_histories_attributes: [
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
      change_reason: change_reasons.sample
    },
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
      change_reason: change_reasons.sample
    },
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
      change_reason: change_reasons.sample
    },
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2014, 1, 1), Date.new(2014, 12, 31)),
      change_reason: "New Hire"
    }
  ]
}

users_data << {
  email: 'user@example.com',
  github_handle: Faker::Internet.user_name(specifier: 5..15),
  password: 'testing123',
  name: Faker::Name.name,
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
  ],
  salary_histories_attributes: [
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
      change_reason: change_reasons.sample
    },
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
      change_reason: change_reasons.sample
    },
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2015, 1, 1), Date.new(2023, 8, 17)),
      change_reason: change_reasons.sample
    },
    {
      job_title: job_titles.sample,
      salary: random_salary(salary_ranges),
      change_date: random_date(Date.new(2014, 1, 1), Date.new(2014, 12, 31)),
      change_reason: "New Hire"
    }
  ]
}

users_data.each do |user_data|
  goals_data = user_data.delete(:goals_attributes)
  salary_histories_data = user_data.delete(:salary_histories_attributes)
  user = User.create!(user_data)
  user.salary_histories.create(salary_histories_data) if salary_histories_data.present?
  user.goals.create(goals_data) if goals_data.present?
end
