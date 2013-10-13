class Character < ActiveRecord::Base
  after_create :initialize_jobs

  attr_accessible :color, :current_job_id, :gender

  belongs_to :team
  belongs_to :topic

  has_many :job_classes, through: :jobs
  has_many :jobs

  def current_job_class
    self.current_job.job_class
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
    initialize_job_levels
  end

  # initialize Squire and Chemist to Level 1
  def initialize_job_levels
    self.jobs.where(job_class_id: 1).first.level = 1
    self.jobs.where(job_class_id: 10).first.level = 1
  end

end
