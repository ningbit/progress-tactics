class Team < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :topics, through: :characters
  has_many :characters
end
