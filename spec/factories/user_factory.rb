# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    name { Faker::Name.first_name }
    phone_number { Faker::PhoneNumber.cell_phone_with_country_code }
  end
end
