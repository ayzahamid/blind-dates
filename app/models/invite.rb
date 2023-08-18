# frozen_string_literal: true

class Invite < ApplicationRecord
  STATUSES = {
    pending: 'pending',
    no: 'no',
    yes: 'yes',
    maybe: 'maybe'
  }.freeze

  enum status: STATUSES

  belongs_to :employee

  validates :start_date_of_week, :status, presence: true
end
