# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invite, type: :model do
  it { should belong_to(:employee) }
  it { should validate_presence_of(:start_date_of_week) }
  it { should validate_presence_of(:status) }

  it 'defines valid enum values for status' do
    valid_statuses = %w[pending no yes maybe]
    is_valid = valid_statuses.include?(subject.status)
    expect(is_valid).to be_truthy
  end
end
