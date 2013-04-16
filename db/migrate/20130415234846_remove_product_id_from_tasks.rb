class RemoveProductIdFromTasks < ActiveRecord::Migration
  def up
    remove_index :tasks, :product_id
    remove_column :tasks, :product_id
  end

  def down
    add_column :tasks, :product_id, :integer
    add_index :tasks, :product_id
  end
end
