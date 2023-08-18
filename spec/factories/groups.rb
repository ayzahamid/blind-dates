# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    start_date_of_week { Faker::Date.backward(days: 7) }
  end
end
