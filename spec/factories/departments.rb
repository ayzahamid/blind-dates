# frozen_string_literal: true

FactoryBot.define do
  factory :department do
    name { Faker::Company.unique.department }
    description { Faker::Lorem.sentence }
  end
end
