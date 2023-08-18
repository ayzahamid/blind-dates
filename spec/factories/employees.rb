# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    department

    trait :with_accepted_invite do
      after(:create) do |employee|
        create(:invite, employee: employee, status: 'yes')
      end
    end
  end
end
