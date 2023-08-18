# frozen_string_literal: true

DEPARMENT_NAMES = %w[engineering sales hr marketing finance].freeze

DEPARMENT_NAMES.each do |name|
  Department.find_or_create_by(name: name)
end
