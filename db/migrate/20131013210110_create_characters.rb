class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :topic_id
      t.integer :team_id
      t.integer :current_job_id, default: 1
      t.integer :total_exp, default: 0
      t.integer :color, default: 1
      t.string :gender, default: "M"

      t.timestamps
    end
  end
end
