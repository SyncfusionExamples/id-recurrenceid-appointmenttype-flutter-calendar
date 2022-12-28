# How to use id, recurrenceId, and appointment Type in the Flutter Calendar (SfCalendar)?

This example demonstrates how to use id, recurrenceId, and appointment Type in the Flutter Calendar.

The Appointment class in the Flutter calendar includes support for appointment types, a recurrence Id, and an ID.

## Appointment types

Different appointment types are supported by the Flutter calendar these types include normal, pattern, occurrence, and changed occurrence.

## Id

Id can be set to all the appointment types where the internally created occurrence appointment will have the same id value as the pattern appointment.The id value for the pattern appointment and the exception appointment should be different. However, the pattern appointment's id value and the exception appointment's recurrenceId should match.

## Recurrence ID

The recurrenceId of the exception appointment and the id of the pattern appointment should be the same. The recurrenceId should be specified only for exception appointments. It is not required for occurrence and normal appointments.

You can also refer our UG documentation to know more about [Appointments](https://help.syncfusion.com/flutter/calendar/appointments) in the Flutter Calendar.

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).