# frozen_string_literal: true

FactoryBot.define do
  factory :invite do
    start_date_of_week { Faker::Date.backward(days: 7) }
    employee
    status { Invite::STATUSES[:pending] }

    trait :accepted do
      status { Invite::STATUSES[:yes] }
    end
  end
end
