class Task < ActiveRecord::Base
  attr_accessible :character_id, :contents, :exp, :hours, :name, :status
  validates :name, presence: true
  validates :character_id, presence: true

  belongs_to :character
end
