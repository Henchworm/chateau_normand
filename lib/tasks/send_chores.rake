# frozen_string_literal: true

desc 'Send chore assignments'
task send_chores: :environment do # :environment will load our Rails app, so we can query the database with ActiveRecord
  TaskAssignmentJob.perform_now
end
