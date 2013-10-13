class Character < ActiveRecord::Base
  after_create :initialize_jobs

  attr_accessible :color, :current_job_id, :gender

  belongs_to :team
  belongs_to :topic

  has_many :job_classes, through: :jobs
  has_many :jobs

  def name
    "#{self.topic.name} #{JobClass.find(self.current_job_id).name}"
  end

  def level

  end

  private

  def initialize_jobs
    
  end

end
