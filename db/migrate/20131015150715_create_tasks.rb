class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :contents
      t.integer :status
      t.integer :exp
      t.float :hours
      t.integer :character_id

      t.timestamps
    end
  end
end
