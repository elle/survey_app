[
  {
    name: "Engineer",
    billable: true,
  },
  {
    name: "Designer",
    billable: true,
  },
  {
    name: "Manager",
    billable: false,
  },
].each do |role_attrs|
  Role.where(role_attrs).first_or_create
end
