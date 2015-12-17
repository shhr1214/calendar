class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.int :event_id
      t.int :user_id

      t.timestamps null: false
    end
  end
end
