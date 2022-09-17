# frozen_string_literal: true

require 'rails_helper'
RSpec.describe TaskAssignmentJob, type: :job do
  include ActiveJob::TestHelper

  let!(:task1) { create(:task) }
  let!(:task2) { create(:task) }
  let!(:task3) { create(:task) }
  let!(:task4) { create(:task) }

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }
  let!(:user4) { create(:user) }

  context 'perform' do
    it 'performs job' do
      described_class.perform_now
    end
  end
end
