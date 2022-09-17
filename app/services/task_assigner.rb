# frozen_string_literal: true

class TaskAssigner
  attr_accessor :roomies, :tasks

  def initialize
    @roomies = User.all.pluck(:email)
    @tasks = Task.all.pluck(:name)
  end

  def self.call
    TaskAssigner.new.call
  end

  def call
    task_data = assign_tasks
    send_mail(task_data)
  end

  def assign_tasks
    assignment = Hash.new(0)
    shuffled = @tasks.shuffle
    @roomies.each do |roomie|
      assignment[roomie] = shuffled.pop
    end
    assignment
  end

  def send_mail(task_data)
    TaskMailer.with(task_data).task_assignment.deliver_now
  end
end
