# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
