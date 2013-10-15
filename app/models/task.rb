class Task < ActiveRecord::Base
  attr_accessible :character_id, :contents, :exp, :hours, :name, :status
  validates :name, presence: true
  validates :type_id, presence: true

  has_many :characters, through: :character_tasks
  has_many :character_tasks

  belongs_to :type
end
