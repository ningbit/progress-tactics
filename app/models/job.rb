class Job < ActiveRecord::Base
  attr_accessible :job_class_id, :level, :character_id

  belongs_to :character
  belongs_to :job_class

  def name
    self.job_class.name
  end

end
