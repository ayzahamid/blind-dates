# frozen_string_literal: true

class GenerateGroups
  include Interactor

  def call
    existing_group = Group.find_by(start_date_of_week: default_start_date)

    context.fail!(message: 'Groups were already created for this week') if existing_group

    employees = Employee.with_accepted_invitations(default_start_date).shuffle

    employees.in_groups(num_of_groups(employees), false).each do |group_employees|
      group = Group.create(start_date_of_week: default_start_date)
      leader = select_leader(group_employees)

      group_employees.each do |employee|
        GroupMembership.create(group_id: group.id, employee_id: employee.id, leader: employee == leader)
      end
    end
  end

  private

  def num_of_groups(employees)
    num_of_employees = employees.size
    base_group_count = num_of_employees / desired_group_size
    remaining_employees = num_of_employees % desired_group_size

    remaining_employees.zero? ? base_group_count : base_group_count + 1
  end

  def select_leader(group_employees)
    recent_leaders = GroupMembership.where(leader: true)
                                    .order(created_at: :desc)
                                    .limit(Group::AVOID_MOST_RECENT_LEADERS)
                                    .pluck(:employee_id)

    available_leaders = group_employees.reject { |employee| recent_leaders.include?(employee.id) }

    available_leaders.sample || group_employees.sample
  end

  def desired_group_size
    Group::SIZE
  end

  def default_start_date
    Time.zone.today.beginning_of_week
  end
end
