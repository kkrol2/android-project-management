class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :mark
      t.integer :project_id

      t.timestamps
    end
  end
end
