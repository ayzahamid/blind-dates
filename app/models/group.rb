# frozen_string_literal: true

class Group < ApplicationRecord
  validates :start_date_of_week, presence: true
end
