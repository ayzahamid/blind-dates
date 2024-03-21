# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupMembership, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:employee) }
end
