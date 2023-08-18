# frozen_string_literal: true

class Group < ApplicationRecord
  validates :start_date_of_week, presence: true

  has_many :group_memberships, dependent: :destroy
  has_many :employees, through: :group_memberships
end
