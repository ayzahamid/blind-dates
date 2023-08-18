# frozen_string_literal: true

class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
