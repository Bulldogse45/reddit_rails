class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :location
      t.integer :vote_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
