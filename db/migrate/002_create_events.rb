class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.string :place
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
