class AddParticipationToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :participation, :string
  end
end
