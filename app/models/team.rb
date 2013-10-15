class Team < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :topics, through: :characters
  has_many :characters

  def change_color(num)
    self.characters.each do |char|
      char.color = num
      char.save
    end
  end

  def tasks
    self.characters.collect { |char| char.tasks }.flatten
  end

end
