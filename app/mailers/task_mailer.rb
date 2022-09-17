class TaskMailer < ApplicationMailer
  include SendGrid
  default from: 'agop5134@gmail.com'
  layout 'mailer'

  def task_assignment
    @data = 'hi'
    @data = params
    users = params.keys

    users.each do |user|
      mail(to: user, subject: "Weekly Chore Lottery")
    end
    # from = Email.new(email: 'agop5134@gmail.com')
    # to = Email.new(email: 'agop5134@gmail.com')
    # subject = 'Weekly Task Assi'
    # content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    # mail = Mail.new(from, subject, to, content)
    #
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers
  end
end
