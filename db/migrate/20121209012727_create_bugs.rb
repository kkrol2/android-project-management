class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :name
      t.text :description
      t.integer :state
      t.integer :project_id

      t.timestamps
    end
  end
end
