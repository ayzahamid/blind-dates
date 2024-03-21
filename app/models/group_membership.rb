# frozen_string_literal: true

class GroupMembership < ApplicationRecord
  belongs_to :group
  belongs_to :employee
end
