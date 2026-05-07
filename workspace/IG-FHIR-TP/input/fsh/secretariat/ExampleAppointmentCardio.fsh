// =====================================================================
// Exemple 1 : Rendez-vous de consultation cardiologique
// =====================================================================
// Scénario : le secrétariat planifie une consultation de cardiologie
// pour M. Antoine Dupont avec le Dr Jean Martin en salle 101.
// =====================================================================

Instance: ExampleAppointmentCardio
InstanceOf: AppointmentSecretariat
Title: "RDV cardiologie - M. Dupont"
Description: "Rendez-vous de consultation cardiologique planifié pour le patient Antoine Dupont avec le Dr Jean Martin en salle 101 le 15 juin 2026."
Usage: #example

// Statut : RDV confirmé
* status = #booked

// Type de RDV : consultation de routine (codes HL7 v2-0276)
* appointmentType = http://terminology.hl7.org/CodeSystem/v2-0276#ROUTINE "Routine appointment"

// Motif lisible
* description = "Consultation cardiologique de suivi annuel"

// Date de création de l'enregistrement (par le secrétariat)
* created = "2026-05-07T10:00:00+02:00"

// Créneau du RDV
* start = "2026-06-15T09:00:00+02:00"
* end   = "2026-06-15T09:30:00+02:00"

// --- Participant : patient ---
* participant[patient].actor = Reference(Patient/example-patient-dupont)
* participant[patient].actor.display = "Antoine Dupont"
* participant[patient].status = #accepted
* participant[patient].required = #required

// --- Participant : soignant ---
// La référence inclut le RPPS pour permettre aux RH de filtrer
// les RDV par numéro RPPS sans résoudre la ressource Practitioner.
* participant[practitioner].actor = Reference(Practitioner/example-practitioner-martin)
* participant[practitioner].actor.identifier.system = "urn:oid:1.2.250.1.71.4.2.1"
* participant[practitioner].actor.identifier.value = "10003557123"
* participant[practitioner].actor.display = "Dr Jean Martin (Cardiologue)"
* participant[practitioner].status = #accepted
* participant[practitioner].required = #required

// --- Participant : salle ---
* participant[location].actor = Reference(Location/example-location-salle101)
* participant[location].actor.display = "Salle 101 - Cardiologie"
* participant[location].status = #accepted
* participant[location].required = #required
