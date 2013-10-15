class CharacterTask < ActiveRecord::Base
  attr_accessible :character_id, :task_id

  belongs_to :character
  belongs_to :task
end
