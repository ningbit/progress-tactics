class CreateCharacterTasks < ActiveRecord::Migration
  def change
    create_table :character_tasks do |t|
      t.integer :character_id
      t.integer :task_id

      t.timestamps
    end
  end
end
