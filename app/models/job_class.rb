class JobClass < ActiveRecord::Base
  attr_accessible :name, :requirements

  has_many :characters, through: :jobs
  has_many :jobs
end
