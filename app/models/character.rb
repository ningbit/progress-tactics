class Character < ActiveRecord::Base
  after_create :initialize_jobs

  attr_accessible :color, :current_job_id, :gender

  belongs_to :team
  belongs_to :topic

  has_many :job_classes, through: :jobs
  has_many :jobs

  def current_job_class
    JobClass.find(self.current_job.id)
  end

  def current_job
    Job.find(self.current_job_id)
  end

  def name
    "#{self.topic.name} #{self.current_job_class.name} Level #{current_job.level}"
  end

  def level

  end

  private

  def initialize_jobs
    JobClass.all.each { |job_class| self.jobs.build(job_class_id: job_class.id) }
  end

end
