# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:department) }
  it { should have_many(:group_memberships).dependent(:destroy) }
  it { should have_many(:groups).through(:group_memberships) }
  it { should have_many(:invites).dependent(:destroy) }

  describe '.with_accepted_invitations' do
    let!(:employee) { create(:employee) }
    let!(:accepted_invite) { create(:invite, employee: employee, status: 'yes') }
    let!(:other_invite) { create(:invite, employee: create(:employee), status: 'no') }

    it 'returns employees with accepted invitations for a specific week' do
      employees = Employee.with_accepted_invitations(accepted_invite.start_date_of_week)
      expect(employees).to include(employee)
      expect(employees).not_to include(other_invite.employee)
    end
  end
end
