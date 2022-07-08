control "SV-216018" do
  title "Audit records must include what type of events occurred."
  desc "Without proper system auditing, individual system accesses cannot be tracked, and 
malicious activity cannot be detected and traced back to an individual account."
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
  tag gtitle: "SRG-OS-000037"
  tag gid: "V-216018"
  tag rid: "SV-216018r603268_rule"
  tag stig_id: "SOL-11.1-010140"
  tag fix_id: "F-17254r372437_fix"
  tag legacy: ["V-47795","SV-60671"]
  tag cci: ["CCI-000130"]
  tag nist: ["AU-3 a"]
end