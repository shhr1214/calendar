class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :employee_id
      t.string :password_digest
      t.integer :auth
      t.date :entry_date
      t.date :retire_date

      t.timestamps null: false
    end
  end
end
