class TaskMailer < ApplicationMailer
  default from: "the_custodian@chateaunormadnie.com"
  layout 'mailer'

  def task_assignment
    @data = params
    users = params.keys
    users.each do |user|
      mail(to: user, subject: "Weekly Chore Lottery")
    end
  end
end
