# frozen_string_literal: true

class Group < ApplicationRecord
  AVOID_MOST_RECENT_LEADERS = 2
  SIZE = 2

  validates :start_date_of_week, presence: true

  has_many :group_memberships, dependent: :destroy
  has_many :employees, through: :group_memberships
end
