class AddSubcategoryIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :subcategory_id, :integer
  end
end
