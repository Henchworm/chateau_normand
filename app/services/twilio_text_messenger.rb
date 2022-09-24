class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def phone_numbers
    User.all.pluck(phone_number)
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create(
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: '15597995639',
        body: "The weekly chore assignments are below: #{message}"
      )
  end
end