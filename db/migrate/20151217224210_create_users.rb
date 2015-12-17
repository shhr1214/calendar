class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.int :employee_id
      t.string :password
      t.int :auth
      t.date :entry_date
      t.date :retire_date

      t.timestamps null: false
    end
  end
end
