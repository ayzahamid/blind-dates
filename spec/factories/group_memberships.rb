# frozen_string_literal: true

FactoryBot.define do
  factory :group_membership do
    leader { false }
    group
    employee
  end
end
