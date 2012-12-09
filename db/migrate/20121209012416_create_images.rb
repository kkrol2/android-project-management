class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :path
      t.integer :project_id

      t.timestamps
    end
  end
end
