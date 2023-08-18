# frozen_string_literal: true

class Invite < ApplicationRecord
  {
    pending: 'pending',
    no: 'no',
    yes: 'yes',
    maybe: 'maybe'
  }

  enum status: STATUSES

  belongs_to :employee

  validates :start_date_of_week, :status, presence: true
end
