# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many(:group_memberships).dependent(:destroy) }
  it { should have_many(:employees).through(:group_memberships) }
  it { should validate_presence_of(:start_date_of_week) }
end
