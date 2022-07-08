control "SV-216117" do
  title "Direct root account login must not be permitted for SSH access."
  desc "The system should not allow users to log in as the root user directly, as audited actions would 
be non-attributable to a specific user."
  desc "check", "Determine if root login is disabled for the SSH service.

# grep \"^PermitRootLogin\" 
/etc/ssh/sshd_config

If the output of this command is not:

PermitRootLogin no

this is 
a finding."
  desc "fix", "The root role is required.

Modify the sshd_config file

# pfedit 
/etc/ssh/sshd_config

Locate the line containing:

PermitRootLogin

Change it 
to:

PermitRootLogin no

Restart the SSH service.

# svcadm restart svc:/network/ssh"
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000480"
  tag gid: "V-216117"
  tag rid: "SV-216117r603268_rule"
  tag stig_id: "SOL-11.1-040360"
  tag fix_id: "F-17353r372734_fix"
  tag legacy: ["V-48103","SV-60975"]
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]
end