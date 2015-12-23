class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.integer :employee_id, null:false
      t.string :password, null:false
      t.integer :auth, null:false, default: 1
      t.date :entry_date, null:false
      t.date :retire_date, null:false, default:'9999-12-31'

      t.timestamps null: false
    end
  end
end
