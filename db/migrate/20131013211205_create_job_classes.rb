class CreateJobClasses < ActiveRecord::Migration
  def change
    create_table :job_classes do |t|
      t.string :name
      t.string :requirements

      t.timestamps
    end
  end
end
