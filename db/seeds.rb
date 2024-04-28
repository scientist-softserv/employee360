# Create a seeded Rob User with Superadmin role
superadmin_email = 'superadmin@example.com'

superadmin_salary_history = SalaryHistory.create(
  job_title: 'Superadmin Role Example Title',
  salary: 200000,
  change_date: Date.new(2015, 1, 1),
  change_reason: 'Annual Raise',
  current_salary: true,
)

User.create!(
  email: superadmin_email,
  password: 'testing123',
  roles: [:employee, :superadmin],
  name: 'Super Admin User',
  github_handle: 'superadmin',
  salary_histories: [superadmin_salary_history],
)

# Create a seeded User with default Employee role
employee_email = 'employee@example.com'

employee_salary_history = SalaryHistory.create(
  job_title: 'Employee Example Title',
  salary: 200000,
  change_date: Date.new(2015, 1, 1),
  change_reason: 'New Hire',
  current_salary: true,
)

User.create!(
  email: employee_email,
  password: 'testing123',
  name: 'Employee',
  github_handle: 'employee',
  salary_histories: [employee_salary_history],
)

# # Admin is not a role in the application yet
# # Create a seeded User with Admin role
admin_email = 'admin@example.com'

admin_salary_history = SalaryHistory.create(
  job_title: 'Employee Example Title',
  salary: 200000,
  change_date: Date.new(2015, 1, 1),
  change_reason: 'New Hire',
  current_salary: true,
)

User.create!(
  email: admin_email,
  password: 'testing123',
  name: 'Employee',
  github_handle: 'employee',
  roles: [:employee, :admin],
  salary_histories: [admin_salary_history],
)

# # Mentor is not a role in the application yet
# # Create a seeded User with Mentor role
# mentor_email = 'mentor@example.com'

# mentor_salary_history = SalaryHistory.create(
#   job_title: 'Employee with Mentor Role Example Title',
#   salary: 200000,
#   change_date: Date.new(2015, 1, 1),
#   change_reason: 'Annual Increase',
#   current_salary: true,
# )

# User.create!(
#   email: mentor_email,
#   password: 'testing123',
#   name: 'Mentor User',
#   github_handle: 'mentor',
#   roles: [:employee, :mentor],
#   salary_histories: [mentor_salary_history],
# )