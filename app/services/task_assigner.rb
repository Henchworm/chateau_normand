# frozen_string_literal: true

class TaskAssigner
  attr_accessor :roomies, :tasks, :assignment

  def initialize
    @roomies = User.all.pluck(:email)
    @tasks = Task.all.pluck(:name)
    @assignment = {}
  end

  def self.call
    TaskAssigner.new.call
  end

  def call
    task_data = assign_tasks
    send_mail(task_data)
  end

  def assign_tasks
    shuffled = @tasks.shuffle
    until shuffled.empty?
      @roomies.shuffle.each do |roomie|
        assignment[roomie] ||= []
        assignment[roomie] << shuffled.pop
        assignment[roomie].compact!
      end
    end
    assignment
  end

  def send_mail(task_data)
    TaskMailer.with(task_data).task_assignment.deliver_now
  end
end
