// Exemple : séance de kiné pour Mme Lefevre avec Mme Dubois.

Instance: ExampleAppointmentKine
InstanceOf: AppointmentSecretariat
Title: "RDV kinésithérapie - Mme Lefevre"
Description: "Séance de kinésithérapie en attente de confirmation."
Usage: #example

// Narrative HTML lisible (corrige le warning dom-6)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>RDV kinésithérapie</b> — Marie Lefevre avec Mme Sophie Dubois (RPPS 81234567890) en Salle 202.</p><p>22 juin 2026 de 14:00 à 14:45 · statut : pending.</p></div>"

* status = #pending
* description = "Séance de rééducation pour entorse de la cheville"
* appointmentType = http://terminology.hl7.org/CodeSystem/v2-0276#FOLLOWUP
* start = "2026-06-22T14:00:00+02:00"
* end = "2026-06-22T14:45:00+02:00"

// Patient
* participant[patient].actor = Reference(Patient/lefevre)
* participant[patient].actor.type = "Patient"
* participant[patient].actor.display = "Marie Lefevre"
* participant[patient].status = #needs-action

// Soignant (avec RPPS)
* participant[practitioner].actor = Reference(Practitioner/dubois)
* participant[practitioner].actor.type = "Practitioner"
* participant[practitioner].actor.identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* participant[practitioner].actor.identifier.value = "81234567890"
* participant[practitioner].actor.display = "Mme Sophie Dubois"
* participant[practitioner].status = #accepted

// Salle
* participant[location].actor = Reference(Location/salle-202)
* participant[location].actor.type = "Location"
* participant[location].actor.display = "Salle 202"
* participant[location].status = #accepted
