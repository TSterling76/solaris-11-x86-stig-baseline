control "SV-216024" do
  title "The audit system must be configured to audit account creation."
  desc "Without auditing, malicious activity cannot be detected."
  desc "check", "The Audit Configuration profile is required.

This check applies to the global zone only. 
Determine the zone that you are currently securing.

# zonename

If the command output is 
\"global\", this check applies.

Determine the OS version you are currently securing.
# 
uname –v

For Solaris 11, 11.1, 11.2, and 11.3:

# pfexec auditconfig -getflags | grep 
active | cut -f2 -d=

If \"ps\" audit flag is not included in output, this is a finding.

For 
Solaris 11.4 or newer:

# pfexec auditconfig -t -getflags | cut -f2 -d=

If \"cusa\" or if the 
\"ft,lo,ap,ss,as,ua,pe” audit flag(s) are not included in output, this is a 
finding.

Determine if auditing policy is set to collect command line arguments.

# pfexec 
auditconfig -getpolicy | grep active | grep argv

If the active audit policies line does not 
appear, this is a finding."
  desc "fix", "The Audit Configuration profile is required. All audit flags must be enabled in a single 
command.

This action applies to the global zone only. Determine the zone that you are 
currently securing.

# zonename

If the command output is \"global\", this action 
applies.

For Solaris 11, 11.1, 11.2, and 11.3:
# pfexec auditconfig -setflags 
cusa,-ps,fd,-fa,fm

For Solaris 11.4 or newer:
# pfexec auditconfig -setflags 
cusa,-fa,-ex,-ps,fd,fm

Enable the audit policy to collect command line arguments.

# 
pfexec auditconfig -setpolicy +argv

These changes will not affect users that are 
currently logged in."
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000004"
  tag gid: "V-216024"
  tag rid: "SV-216024r793034_rule"
  tag stig_id: "SOL-11.1-010230"
  tag fix_id: "F-17260r372455_fix"
  tag legacy: ["V-47807","SV-60683"]
  tag cci: ["CCI-000018"]
  tag nist: ["AC-2 (4)"]
end