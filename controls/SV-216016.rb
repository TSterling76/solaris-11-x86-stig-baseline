control "SV-216016" do
  title "The operating system must generate audit records for the selected list of auditable events as 
defined in DoD list of events."
  desc "Without auditing, individual system accesses cannot be tracked, and malicious activity 
cannot be detected and traced back to an individual account.

Without accurate time stamps, 
source, user, and activity information, malicious activity cannot be accurately 
tracked.

Without an audit reduction and reporting capability, users find it difficult to 
identify specific patterns of attack."
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
  tag gtitle: "SRG-OS-000064"
  tag gid: "V-216016"
  tag rid: "SV-216016r603268_rule"
  tag stig_id: "SOL-11.1-010120"
  tag fix_id: "F-17252r372431_fix"
  tag legacy: ["V-47791","SV-60667"]
  tag cci: ["CCI-000172"]
  tag nist: ["AU-12 c"]
end