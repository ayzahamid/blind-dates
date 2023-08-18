json.extract! group, :id

json.employees group.employees do |employee|
  json.employee_name employee.name
  json.employee_dept_name employee.department.name
end
