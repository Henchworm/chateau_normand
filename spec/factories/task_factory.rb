# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::Games::Fallout.quote }
  end
end
