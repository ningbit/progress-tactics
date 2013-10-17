class Character < ActiveRecord::Base
  after_create :initialize_jobs

  attr_accessible :color, :current_job_id, :gender, :topic_id

  belongs_to :team
  belongs_to :topic

  has_many :job_classes, through: :jobs
  has_many :jobs

  has_many :tasks, through: :character_tasks
  has_many :character_tasks 

  def current_job_class
    self.current_job.job_class
  end

  def current_job
    Job.find(self.current_job_id)
  end

  def name
    self.topic.name
  end

  def job_level
    "#{self.current_job_class.name} Lvl #{current_job.level}"
  end

  private

  def initialize_jobs
    JobClass.all.each { |job_class| self.jobs.build(job_class_id: job_class.id) }
    self.save
    initialize_job_levels
  end

  # initialize Squire and Chemist to Level 1
  def initialize_job_levels
    self.jobs.where(job_class_id: [1,10]).each do |job|
      job.level = 1
      job.save
    end
  end

end
