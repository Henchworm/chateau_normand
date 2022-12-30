require 'rails_helper'
RSpec.describe 'Task Assigner' do
  let!(:user) { create(:user) }
  let!(:task) { create(:task) }

  before do
    # allow_any_instance_of(TaskMailer).to recieve(:call).and_return(true)
    allow_any_instance_of(TwilioTextMessenger).to receive(:call).and_return(true)
  end


  it 'assigns tasks to a user' do
    expect(user.tasks).to eq([])
    TaskAssigner.call
    expect(user.tasks.first).to eq(task)
  end
end
