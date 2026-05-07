Profile: AppointmentSecretariat
Parent: Appointment
Id: appointment-secretariat
Title: "Rendez-vous - Secrétariat"
Description: "Rendez-vous entre un patient, un soignant et une salle de l'hôpital."

* status MS
* start 1..1 MS
* end 1..1 MS
* description MS
* appointmentType MS

* participant 3..* MS
* participant ^slicing.discriminator.type = #profile
* participant ^slicing.discriminator.path = "actor.resolve()"
* participant ^slicing.rules = #open
* participant contains
    patient 1..1 MS and
    practitioner 1..1 MS and
    location 1..1 MS

* participant[patient].actor 1..1 MS
* participant[patient].actor only Reference(Patient)

* participant[practitioner].actor 1..1 MS
* participant[practitioner].actor only Reference(Soignant or SoignantRole)
* participant[practitioner].actor.identifier 1..1 MS
* participant[practitioner].actor.identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* participant[practitioner].actor.identifier.value 1..1 MS

* participant[location].actor 1..1 MS
* participant[location].actor only Reference(Location)

* obeys fin-apres-debut

Invariant: fin-apres-debut
Description: "La date de fin doit être après la date de début"
Severity: #error
Expression: "end > start"
