class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.text :description
      t.boolean :enabled
      t.integer :project_id

      t.timestamps
    end
  end
end
