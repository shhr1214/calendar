class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  extend Enumerize
  enumerize :participation, in: %i(going interested ignore), scope: true
end
