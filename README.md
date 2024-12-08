### Directory

- **openssl_req.cnf** - a basic config for generating CSRs with OpenSSL
- **GPO** - starter group policy for a lab environment
  - Adds firewall rules blocked Windows Update, Update Orchestrator, Windows Update Medic Service, and Microsoft Store (inbound and outbound)
  - Disables wuauserv and other unnecessary services
  - Runs Powershell script (remember to add its location!) that redirects MS domains to 0.0.0.0 via hosts file
