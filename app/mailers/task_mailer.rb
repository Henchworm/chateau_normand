class TaskMailer < ApplicationMailer
  include SendGrid
  default from: 'agop5134@gmail.com'
  layout 'mailer'

  def task_assignment
    @data = params.to_s.gsub('=>', ':').delete('{}[]""')
    users = params.keys
    mail(to: users, subject: 'Weekly Chore Lottery')
  end
end
