class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :contents
      t.integer :status, default: 0
      t.integer :exp, default: 50
      t.float :hours, default: 0.5
      t.integer :character_id

      t.timestamps
    end
  end
end
