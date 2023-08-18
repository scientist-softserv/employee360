class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals
  has_many :salary_histories

  enum role: { employee: 0, admin: 1 }

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employee
  end
end
