class AddDesriptionImage < ActiveRecord::Migration
  def up
  	add_column :images, :description, :string
  end

  def down
  	remove_column :images, :description
  end
end
