class Job < ActiveRecord::Base
  attr_accessible :job_class_id, :level, :topic_character_id
end
