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
    JobClass.all.each { |job_class| self.jobs.build(job_class_id: job_class.id) }
  end

end
