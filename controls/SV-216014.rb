control "SV-216014" do
  title "The operating system must provide the capability to automatically process audit records for 
events of interest based upon selectable, event criteria."
  desc "Without an audit reporting capability, users find it difficult to identify specific 
patterns of attack."
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
  tag gtitle: "SRG-OS-000054"
  tag gid: "V-216014"
  tag rid: "SV-216014r603268_rule"
  tag stig_id: "SOL-11.1-010080"
  tag fix_id: "F-17250r372425_fix"
  tag legacy: ["SV-60663","V-47787"]
  tag cci: ["CCI-000158"]
  tag nist: ["AU-7 (1)"]

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
