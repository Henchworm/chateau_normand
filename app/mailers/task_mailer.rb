# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  include SendGrid
  include ParamsFormatter

  default from: 'agop5134@gmail.com'
  layout 'mailer'

  def task_assignment
    @data = format_params(params)
    users = User.all.pluck(:email)
    mail(to: users, subject: 'Weekly Chore Lottery')
  end
end
