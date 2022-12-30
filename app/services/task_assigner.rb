# frozen_string_literal: true

class TaskAssigner
  attr_accessor :roomies, :tasks

  def initialize
    @roomies = User.all
    @tasks = Task.all
  end

  def self.call
    TaskAssigner.new.call
  end

  def call
    assign_tasks
    binding.pry
    send_mail(task_data)
    send_text(task_data)
  end

  def assign_tasks
    shuffled = @tasks.shuffle
    until shuffled.empty?
      @roomies.each do |roomie|
        roomie.tasks << shuffled.pop
      end
    end
  end

  def send_mail(task_data)
    TaskMailer.with(task_data).task_assignment.deliver_now
  end

  def send_text(task_data)
    TwilioTextMessenger.new(task_data).call
  end
end
