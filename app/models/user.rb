class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals
  has_many :salary_histories

  after_initialize :set_default_roles, if: :new_record?

  def set_default_roles
    self.roles ||= []  # Initialize roles as an empty array if not present
  end

  def add_role(role)
    self.roles = (roles || []) + [role.to_s] unless roles&.include?(role.to_s)
    self.roles.uniq!
    save
  end

  def has_role?(role)
    roles&.include?(role.to_s)
  end

  def start_date
    # Find the earliest salary history record with 'New Hire' change_reason
    salary_history = salary_histories.find_by(change_reason: 'New Hire')
    salary_history&.change_date
  end

  def current_title
    # Find the latest salary history record with 'true' current_salary
    salary_history = salary_histories.find_by(current_salary: true)
    salary_history&.job_title
  end

  def last_promotion
    # Find the most recent promotion date from salary history records
    salary_history = salary_histories.where(change_reason: 'Promotion').order(change_date: :desc).first

    if salary_history
      salary_history.change_date
    else
      nil  # Return nil instead of "Not Applicable"
    end
  end

  def current_compensation
    # Find the latest salary history record
    salary_history = salary_histories.order(change_date: :desc).first
    salary_history&.salary
  end
end
