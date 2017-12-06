# Welcome to the iQuipsys Positron Tracker cmdlets documentation.

Using this documentation you can view and use examples of interaction with system by powershell cmdlets.

## Instalation

- Download **tracker-ps** from this [this](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/tracker-ps) page.


- Add path to ***tracker-ps*** folder to **PSModulePath** in system variables.


- Import module in powershell using command ```Import-Module tracker-ps```

## Usage

To execute almost all request you have to sign in to system. Sign in to system can be performed by cmdlet *Connect-IqtFacade*, this cmdlet is described at [Connections](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Connections.md).

After connecting to facade, if you have proper role, you can execute any cmdlet described on links below. After working with system recomended to use *Disconnect-IqtFacade* to close session.

Example of usage

```
$conn = Connect-IqtFacade -Host tracker.pipservices.net -Port 8080 -Login "user@gmail.com" -Password "password"

$sites = Get-IqtSites

Disconnect-IqtFacade
```

The script above connects to system and saving all user sites to *$sites* variable. Don't forget to set correct *Login* and *Password* parameners

## Navigation

* [Beacons](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Beacons.md)
* [ControlObects](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/ControlObects.md)
* [Devices](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Devices.md)
* [EmergencyPlans](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/EmergencyPlans.md)
* [EventTemplates](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/EventTemplates.md)
* [Gateways](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Gateways.md)
* [Invitations](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Invitations.md)
* [Locations](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Locations.md)
* [ObjectGroups](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/ObjectGroups.md)
* [Resolutions](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Resolutions.md)
* [Rules](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Rules.md)
* [Shifts](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Shifts.md)
* [Sites](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Sites.md)
* [Zones](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/configurations/Zones.md)

* [MessageTemplates](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/content/MessageTemplates.md)

* [ObjectPositions](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/historical/ObjectPositions.md)
* [ObjectStates](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/historical/ObjectStates.md)
* [OperationalEvents](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/historical/OperationalEvents.md)

* [Statistics](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/infrastructure/Statistics.md)

* [Corrections](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/realtime/Corrections.md)
* [CurrentObjectStates](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/realtime/CurrentObjectStates.md)
* [Incidents](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/realtime/Incidents.md)
* [RestGateway](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/realtime/RestGateway.md)
* [Rosters](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/realtime/Rosters.md)
* [Signals](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/realtime/Signals.md)

* [Accounts](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Accounts.md)
* [Activities](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Activities.md)
* [Connections](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Connections.md)
* [Emails](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Emails.md)
* [EmailSettings](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/EmailSettings.md)
* [Passwords](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Passwords.md)
* [Roles](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Roles.md)
* [Sessions](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Sessions.md)
* [Sms](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/Sms.md)
* [SmsSettings](https://github.com/iquipsys-positron/iqp-docs-cmdlets/blob/master/users/SmsSettings.md)