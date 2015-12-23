class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.text :description, null: false
      t.string :place, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end
  end
end
