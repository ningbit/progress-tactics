class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :job_class_id
      t.integer :topic_character_id
      t.integer :level

      t.timestamps
    end
  end
end
