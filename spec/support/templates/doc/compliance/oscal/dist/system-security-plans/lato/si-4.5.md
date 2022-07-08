---
implementation-status:
  - c-not-implemented
  - c-partially-implemented
  - c-planned
  - c-alternative-implementation
  - c-not-applicable
control-origination:
  - c-inherited
  - c-common-control
  - c-hybrid-control
  - c-system-specific-control
sort-id: si-04.05
---

# si-4.5 - \[\] System-generated Alerts

## Control Statement

Alert all staff with system administration, monitoring, and/or security responsibilities including but not limited to ISSM, ISSO, System Program Managers, Sys/Net/App Admins, etc. when the following system-generated indications of compromise or potential compromise occur: compromise indicators may include but shall not be limited to the following: - Protected system files or directories have been modified without notification from the appropriate change/configuration management channels. - System performance indicates resource consumption that is inconsistent with expected operating conditions. - Auditing functionality has been disabled or modified to reduce audit visibility. - Audit or log records have been deleted or modified without explanation. - The system is raising alerts or faults in a manner that indicates the presence of an abnormal condition. - Resource or service requests are initiated from clients that are outside of the expected client membership set. - The system reports failed logins or password changes for administrative or key service accounts. - Processes and services are running that are outside of the baseline system profile. - Utilities, tools, or scripts have been saved or installed on production systems without clear indication of their use or purpose.

## Control guidance

Alerts may be generated from a variety of sources, including audit records or inputs from malicious code protection mechanisms, intrusion detection or prevention mechanisms, or boundary protection devices such as firewalls, gateways, and routers. Alerts can be automated and may be transmitted telephonically, by electronic mail messages, or by text messaging. Organizational personnel on the alert notification list can include system administrators, mission or business owners, system owners, information owners/stewards, senior agency information security officers, senior agency officials for privacy, system security officers, or privacy officers. In contrast to alerts generated by the system, alerts generated by organizations in [SI-4(12)](#si-4.12) focus on information sources external to the system, such as suspicious activity reports and reports on potential insider threats.

## Control assessment-objective

all staff with system administration, monitoring, and/or security responsibilities including but not limited to ISSM, ISSO, System Program Managers, Sys/Net/App Admins, etc. are alerted when system-generated compromise indicators may include but shall not be limited to the following: - Protected system files or directories have been modified without notification from the appropriate change/configuration management channels. - System performance indicates resource consumption that is inconsistent with expected operating conditions. - Auditing functionality has been disabled or modified to reduce audit visibility. - Audit or log records have been deleted or modified without explanation. - The system is raising alerts or faults in a manner that indicates the presence of an abnormal condition. - Resource or service requests are initiated from clients that are outside of the expected client membership set. - The system reports failed logins or password changes for administrative or key service accounts. - Processes and services are running that are outside of the baseline system profile. - Utilities, tools, or scripts have been saved or installed on production systems without clear indication of their use or purpose occur.

______________________________________________________________________

## What is the solution and how is it implemented?

Add control implementation description here for control si-4.5

______________________________________________________________________