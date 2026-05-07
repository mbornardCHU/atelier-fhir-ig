// Exemple : RDV de cardiologie pour M. Dupont avec le Dr Martin.

Instance: ExampleAppointmentCardio
InstanceOf: AppointmentSecretariat
Title: "RDV cardiologie - M. Dupont"
Description: "Consultation de cardiologie."
Usage: #example

* status = #booked
* description = "Consultation cardiologique de suivi"
* appointmentType = http://terminology.hl7.org/CodeSystem/v2-0276#ROUTINE
* start = "2026-06-15T09:00:00+02:00"
* end = "2026-06-15T09:30:00+02:00"

// Patient
* participant[patient].actor = Reference(Patient/dupont)
* participant[patient].actor.type = "Patient"
* participant[patient].actor.display = "Antoine Dupont"
* participant[patient].status = #accepted

// Soignant (avec RPPS)
* participant[practitioner].actor = Reference(Practitioner/martin)
* participant[practitioner].actor.type = "Practitioner"
* participant[practitioner].actor.identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* participant[practitioner].actor.identifier.value = "10003557123"
* participant[practitioner].actor.display = "Dr Jean Martin"
* participant[practitioner].status = #accepted

// Salle
* participant[location].actor = Reference(Location/salle-101)
* participant[location].actor.type = "Location"
* participant[location].actor.display = "Salle 101"
* participant[location].status = #accepted
