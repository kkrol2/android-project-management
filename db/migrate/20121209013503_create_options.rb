class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.integer :votes_number
      t.integer :survey_id

      t.timestamps
    end
  end
end
