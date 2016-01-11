class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :user_id
      t.date :date
      t.boolean :day
      t.boolean :night

      t.timestamps null: false
    end
  end
end
