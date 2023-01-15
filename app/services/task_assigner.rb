# frozen_string_literal: true

class TaskAssigner
  attr_accessor :roomies, :tasks, :task_data

  def initialize
    @roomies = User.all
    @tasks = Task.all
  end

  def self.call
    TaskAssigner.new.call
  end

  def call
    clear_existing_tasks
    assign_tasks
    @task_data = build_hash
    send_mail(task_data)
    send_text(task_data)
  end

  def clear_existing_tasks
    roomies.each { |roomie| roomie.tasks.delete_all }
  end

  def assign_tasks
    tasks.shuffle.zip(roomies.shuffle.cycle).each do |task, user|
      user.tasks << task
    end
  end

  def build_hash
    task_hash = Hash.new(0)
    roomies.each do |roomie|
      task_hash["#{roomie.name}"] = roomie.tasks.pluck(:name)
    end
    task_hash
  end

  def send_mail(task_data)
    TaskMailer.with(task_data).task_assignment.deliver_now
  end

  def send_text(task_data)
    TwilioTextMessenger.new(task_data).call
  end
end
