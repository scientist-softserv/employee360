# This file should contain all the record creation
# needed to seed the database with its default values.

# Create a seeded Rob User with Superadmin role
superadmin_salary_history = SalaryHistory.create(
  job_title: 'Superadmin Role Example Title',
  salary: 200000,
  change_date: Date.new(2015, 1, 1),
  change_reason: 'New Hire',
  current_salary: true
)

if ENV['INITIAL_SUPER_ADMIN_EMAIL'] && ENV['INITIAL_SUPER_ADMIN_PASSWORD']
  superadmin = User.find_or_create_by(email: ENV['INITIAL_SUPER_ADMIN_EMAIL']) do |u|
    u.password = ENV['INITIAL_SUPER_ADMIN_PASSWORD']
    u.roles = ['employee', 'superadmin']
    u.name = 'Super Admin User'
    u.github_handle = 'superadmin'
    u.review_document = 'https://example.com'
  end
  superadmin.salary_histories << superadmin_salary_history unless superadmin.salary_histories.include?(superadmin_salary_history)
  superadmin.save
end

# Create a seeded User with Admin role

admin_salary_history = SalaryHistory.create(
  job_title: 'Admin Role Example Title',
  salary: 200000,
  change_date: Date.new(2015, 1, 1),
  change_reason: 'New Hire',
  current_salary: true
)

if ENV['INITIAL_ADMIN_EMAIL'] && ENV['INITIAL_ADMIN_PASSWORD']
  admin = User.find_or_create_by(email: ENV['INITIAL_ADMIN_EMAIL']) do |u|
    u.password = ENV['INITIAL_ADMIN_PASSWORD']
    u.name = 'Admin User'
    u.roles = ['employee', 'admin']
    u.github_handle = 'admin'
    u.review_document = 'https://example.com'
  end
  admin.salary_histories << admin_salary_history unless admin.salary_histories.include?(admin_salary_history)
  admin.save
end

# Create a seeded User with default Employee role
employee_salary_history = SalaryHistory.create(
  job_title: 'Employee Example Title',
  salary: 200000,
  change_date: Date.new(2015, 1, 1),
  change_reason: 'New Hire',
  current_salary: true
)

if ENV['INITIAL_USER_EMAIL'] && ENV['INITIAL_USER_PASSWORD']
  employee = User.find_or_create_by(email: ENV['INITIAL_USER_EMAIL']) do |u|
    u.password = ENV['INITIAL_USER_PASSWORD']
    u.name = 'Default Employee User'
    u.roles = ['employee']
    u.github_handle = 'employee'
    u.review_document = 'https://example.com'
  end
  employee.salary_histories << employee_salary_history unless employee.salary_histories.include?(employee_salary_history)
  employee.save
end