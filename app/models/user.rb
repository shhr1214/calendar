class User < ActiveRecord::Base
  has_many :participants
  has_many :events, through: :participants

  validates :name, presence: true
  validates :employee_id, presence: true
  validates :password, presence: true
  validates :auth, presence: true
  validates :entry_date, presence: true
  validates :retire_date, presence: true
end
