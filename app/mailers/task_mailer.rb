class TaskMailer < ApplicationMailer
  default from: "the_custodian@chateaunormadnie.com"
  layout 'mailer'

  def task_assignment
    @data = params
    users = params.keys
    mail(to: users, subject: "Weekly Chore Lottery")
  end
end
