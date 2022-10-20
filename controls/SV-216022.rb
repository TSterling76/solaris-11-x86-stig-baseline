control "SV-216022" do
  title "Audit records must include the outcome (success or failure) of the events that occurred."
  desc "Tracking both the successful and unsuccessful attempts aids in identifying threats to the 
system."
  desc "check", "The Audit Configuration profile is required.

This check applies to the global zone only. 
Determine the zone that you are currently securing.

# zonename

If the command output is 
\"global\", this check applies.

Check the status of the audit system. It must be auditing.

# 
pfexec auditconfig -getcond

If this command does not report:

audit condition = 
auditing

this is a finding."
  desc "fix", "The Audit Control profile is required.

This action applies to the global zone only. 
Determine the zone that you are currently securing.

# zonename

If the command output is 
\"global\", this action applies.

If auditing has been disabled, it must be enabled with the 
following command:

# pfexec audit -s"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000041"
  tag gid: "V-216022"
  tag rid: "SV-216022r603268_rule"
  tag stig_id: "SOL-11.1-010180"
  tag fix_id: "F-17258r372449_fix"
  tag legacy: ["V-47803","SV-60679"]
  tag cci: ["CCI-000134"]
  tag nist: ["AU-3 e"]

  unless command('zonename').stdout.strip == "global"
    impact 0.0
    describe 'This control is Not Applicable. This control applies to the global zone only.' do
      skip 'This control is Not Applicable. This control applies to the global zone only.' 
    end
  else
    audit_condition_value = command("pfexec auditconfig -getcond").stdout.strip.split("=").collect(&:strip)[1]
    describe audit_condition_value do
      it { should cmp 'auditing'}
    end
  end
end