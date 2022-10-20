control "SV-216011" do
  title "The audit system must produce records containing sufficient information to establish the 
identity of any user/subject associated with the event."
  desc "Enabling the audit system will produce records with accurate time stamps, source, user, and 
activity information. Without this information malicious activity cannot be accurately 
tracked."
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

audit condition = auditing

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
  tag gtitle: "SRG-OS-000255"
  tag gid: "V-216011"
  tag rid: "SV-216011r603268_rule"
  tag stig_id: "SOL-11.1-010040"
  tag fix_id: "F-17247r372416_fix"
  tag legacy: ["V-47781","SV-60657"]
  tag cci: ["CCI-001487"]
  tag nist: ["AU-3 f"]

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
