class Event < ActiveRecord::Base
  has_many :participants
  has_many :users, through: :participants
  belongs_to  :author, class_name: "User"

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true
  validates :place, presence: true
  validates :author_id, presence: true
end
