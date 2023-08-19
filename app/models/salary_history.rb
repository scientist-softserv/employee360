class SalaryHistory < ApplicationRecord
  belongs_to :user
  attribute :current_salary, default: false
end
