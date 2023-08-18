# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, presence: true

  belongs_to :department

  has_many :group_memberships, dependent: :destroy
  has_many :group, through: :group_memberships
  has_many :invites, dependent: :destroy

  scope :with_accepted_invitations, lambda { |start_date|
    joins(:invites)
      .where(invites: { start_date_of_week: start_date, status: 'yes' })
  }
end
