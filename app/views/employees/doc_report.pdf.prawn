
pdf.text "Employee name: "+@employee[0].full_name
pdf.move_down(10)

available_offs = @employee[0].available_offs.collect do |available_off|
[
available_off.leave_policy.policy_type,
available_off.no_of_days
]
end

available_offs.unshift ["Leave Type","No. of days"]
pdf.table available_offs, :header => true
