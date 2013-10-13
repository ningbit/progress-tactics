class CreateTopicCharacters < ActiveRecord::Migration
  def change
    create_table :topic_characters do |t|
      t.integer :topic_id
      t.integer :team_id
      t.integer :current_job_id, default: 1
      t.integer :level, default: 1
      t.integer :color, default: 1
      t.string :gender, default: "m"

      t.timestamps
    end
  end
end
