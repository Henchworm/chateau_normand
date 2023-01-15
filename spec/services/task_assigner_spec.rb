# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Task Assigner' do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  let!(:task) { create(:task) }
  let!(:task2) { create(:task) }


  before do
    allow_any_instance_of(TwilioTextMessenger).to receive(:call).and_return(true)
  end

  it 'assigns tasks to a user' do
    expect(user.tasks).to eq([])
    TaskAssigner.call
    user.reload
    expect(user.tasks.first).to be_a(Task)
  end

  it 'assign tasks equally' do
    TaskAssigner.call

    expect(user.tasks.count).to eq(1)
    expect(user2.tasks.count).to eq(1)
  end
end
