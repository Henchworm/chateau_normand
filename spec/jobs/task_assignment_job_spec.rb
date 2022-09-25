# frozen_string_literal: true

require 'rails_helper'
RSpec.describe TaskAssignmentJob, type: :job do
  include ActiveJob::TestHelper

  let!(:task1) { create(:task) }
  let!(:task2) { create(:task) }
  let!(:task3) { create(:task) }
  let!(:task4) { create(:task) }
  let!(:task5) { create(:task) }
  let!(:task6) { create(:task) }

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }
  let!(:user4) { create(:user) }

  context 'perform' do
    it 'performs job' do
      described_class.perform_now
      # allow_any_instance_of(Twilio::REST::Client).to receieve(:post).and_return("Test!")
      expect(ActionMailer::Base.deliveries.count).to eq(1)
      attachment = ActionMailer::Base.deliveries.first
      expect(ActionMailer::Base.deliveries.first.subject).to eq('Weekly Chore Lottery')
    end
  end
end
