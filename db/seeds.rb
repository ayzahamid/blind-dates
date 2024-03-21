# frozen_string_literal: true

DEPARMENT_NAMES = %w[engineering sales hr marketing finance].freeze

DEPARMENT_NAMES.each do |name|
  dept = Department.find_or_create_by(name: name)

  next if dept.employees&.size.to_i > 3

  3.times do
    Employee.create(name: Faker::Name.name, department_id: dept.id)
  end
end
