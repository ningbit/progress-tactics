require 'csv'

class Task < ActiveRecord::Base
  attr_accessible :character_id, :contents, :exp, :hours, :name, :status, :number, :type_id
  validates :name, presence: true
  validates :type_id, presence: true

  has_many :characters, through: :character_tasks
  has_many :character_tasks

  belongs_to :type

  def self.load_csv(file,user=User.first)
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      task = row.to_hash
      # create new task
      new_task = {}
      new_task[:name] = task["name"]
      new_task[:contents] = task["contents"]
      new_task[:exp] = task["exp"].to_i
      new_task[:hours] = task["hours"].to_f
      new_task[:status] = task["status"].to_i
      new_task[:number] = task["number"].to_i
      puts "intializing task #{new_task[:name]}"



      # Assign task a type
      if type = Type.find_by_name(task["type"])
        new_task[:type_id] = type.id
        puts "Assigning Type: #{type.name}"
      else
        puts "Task does not have valid type! Skipping to next task"
        next
      end

      t = Task.new(new_task)
      puts t.save ? "+Task Created" : "-Task Creation Failed" 

      # Assign task to characters (topics)
      topic_array = task["topic"].split
      topic_array = task["topic"].split('/') if task["topic"].match('/')
      topic_array = task["topic"].split(',') if task["topic"].match(',')

      topic_array.each do |topic|
        if topic_id = Topic.find_by_name(topic).try("id")
          if character = user.team.characters.where(topic_id: topic_id).first
            character.tasks << t
            puts "Add to Character: #{character.topic.name}"
          end
        end

      end

    end
  end
end
