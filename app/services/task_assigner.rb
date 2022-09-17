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
    assign_tasks
  end

  def assign_tasks
    assignment = Hash.new(0)
    shuffled = @tasks.shuffle
    @roomies.each do |roomie|
      assignment[roomie] = shuffled.pop
    end
    assignment
  end
end
