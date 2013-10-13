class Topic < ActiveRecord::Base
  attr_accessible :name

    has_many :teams, through: :characters
    has_many :characters
end
