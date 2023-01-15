# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user, required: false
end
