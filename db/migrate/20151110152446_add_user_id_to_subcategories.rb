class AddUserIdToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :user_id, :integer
  end
end
