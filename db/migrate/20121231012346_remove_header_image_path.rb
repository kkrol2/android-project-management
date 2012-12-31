class RemoveHeaderImagePath < ActiveRecord::Migration
   def up
    remove_column :projects, :header_image_path
  end

  def down
  end
end
