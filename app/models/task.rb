class Task < ActiveRecord::Base
  attr_accessible :character_id, :contents, :exp, :hours, :name, :status

  belongs_to :character
end
