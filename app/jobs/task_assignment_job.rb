# frozen_string_literal: true

class TaskAssignmentJob < ApplicationJob
  # queue_as :default

  def perform
    TaskAssigner.call
    # Do something later
  end
end
