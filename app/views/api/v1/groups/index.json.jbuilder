json.data @groups do |group|
  json.partial! "api/v1/groups/group", group: group
end
