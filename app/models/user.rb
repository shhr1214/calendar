class User < ActiveRecord::Base
  extend Enumerize
  enumerize :auth, in: %i(admin normal)

  has_many :participants
  has_many :events, through: :participants

  validates :name, presence: true
  validates :employee_id, presence: true
  validates :password, presence: true
  validates :auth, presence: true
  validates :entry_date, presence: true
  validates :retire_date, presence: true
  default_value_for :entry_date, Date.today
  default_value_for :retire_date, '9999-12-31'
end
