# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { Faker::TvShows::Seinfeld.business }
  end
end
