class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :job_class_id
      t.integer :character_id
      t.integer :level, default: -1

      t.timestamps
    end
  end
end
