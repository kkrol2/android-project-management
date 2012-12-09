class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :link_to_app
      t.text :header_image_path
      t.text :header_text

      t.timestamps
    end
  end
end
