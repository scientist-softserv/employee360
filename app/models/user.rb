class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Constructor with new fields
  def initialize(attributes = {})
    super
    @name = attributes[:name]
    @start_date = attributes[:start_date]
    @title = attributes[:title]
    @last_promotion = attributes[:last_promotion]
    @current_compensation = attributes[:current_compensation]
    @due_for_promotion = attributes[:due_for_promotion]
    @review_document = attributes[:review_document]
    @last_1_on_1 = attributes[:last_1_on_1]
    @next_1_on_1 = attributes[:next_1_on_1]
  end
end
